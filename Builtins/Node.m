%
% @(#)Node.m	1.2  3/6/91
%
const Node <- immutable object Node builtin 0x1008
    const NodeType <- typeobject NodeType builtin 0x1608
        operation getActiveNodes -> [ NodeList ]
        operation getAllNodes    -> [ NodeList ]
        operation getNodeInformation [ Node ] -> [ NodeListElement ]
        operation getTimeOfDay -> [ Time ]
        operation delay [ Time ]
        operation waitUntil [ Time ]
        operation getLoadAverage -> [ Real ]
        operation setDiscoveredNodeEventHandler [ Handler ]
        operation setNodeEventHandler [ Handler ]
        operation removeNodeEventHandler [ Handler ]
        operation getStdin -> [InStream]
        operation getStdout -> [OutStream]
        function  getLNN -> [Integer]
        function  getIncarnationTime -> [Time]
        function  getName -> [String]
        operation setRootDirectory [Directory]
        function getRootDirectory -> [Directory]
        operation setLocationServer [Any]
        function getLocationServer -> [Any]
        operation mergeWith [String, Integer]
    end NodeType

    export function getSignature -> [ result : Signature ]
        result <- NodeType
    end getSignature

    export operation getStdin -> [ result : InStream ]
        primitive "SYS" "GETSTDIN" 0 [result] <- []
    end getStdin

    export operation getStdout -> [ result : OutStream ]
        primitive "SYS" "GETSTDOUT" 0 [result] <- []
    end getStdout

    export operation create [rd : Directory, mylnn : Integer] -> [ n : NodeType ]
        n <- object aNode builtin 0x1408
            field rootDirectory : Directory <- rd
            var eventhandlers : VectorOfAny
            const EventType <- enumeration EventType
                NODE_EVENT, DISCOVERED_NODE_EVENT
            end EventType
            const Runnable <- typeobject Runnable
                op run [ Handler ]
            end Runnable

            operation iGetTimeOfDay -> [secs : Integer, usecs : Integer]
                primitive "SYS" "GETTOD" 0 [ secs, usecs ] <- [ ]
            end iGetTimeOfDay

            operation setEventHandler [ et : EventType, h : Handler ]
                if eventhandlers == nil then
                    eventhandlers <- VectorOfAny.create[8]
                    for i : Integer <- 0 while i < 8 by i <- i + 1
                        var tuple : VectorOfAny <- VectorOfAny.create[2]
                        eventhandlers[i] <- tuple
                    end for
                end if
                const upb : Integer <- eventhandlers.upperbound
                const len : Integer <- upb + 1
                for i : Integer <- 0 while i < len by i <- i + 1
                    const tuple : VectorOfAny <- eventhandlers[i]
                    const th : Handler <- tuple[1]
                    if th == h then
                        return
                    end if
                end for
                for i : Integer <- 0 while i < len by i <- i + 1
                    const tuple : VectorOfAny <- eventhandlers[i]
                    const th : Handler <- tuple[1]
                    if th == nil then
                        tuple[0] <- et
                        tuple[1] <- h
                        return
                    end if
                end for
                %
                % Grow the handlers
                %
                const oldeventhandlers <- eventhandlers
                eventhandlers <- VectorOfAny.create[2 * len]
                for i : Integer <- 0 while i < len by i <- i + 1
                    const tuple : VectorOfAny <- oldeventhandlers[i]
                    eventhandlers[i] <- tuple
                end for

                for i : Integer <- len while i < len * 2 by i <- i + 1
                    var tuple : VectorOfAny <- VectorOfAny.create[2]
                    eventhandlers[i] <- tuple
                end for

                var tuple : VectorOfAny <- eventhandlers[len]
                tuple[0] <- et
                tuple[1] <- h
            end setEventHandler

            operation fireEvent [ et : EventType, r : Runnable ]
                if eventhandlers == nil then return end if
                const upb : Integer <- eventhandlers.upperbound
                const len : Integer <- upb + 1
                for i : Integer <- 0 while i < len by i <- i + 1
                    const tuple : VectorOfAny <- eventhandlers[i]
                    const ev : EventType <- tuple[0]
                    if ev !== nil and ev = et then
                        const h : Handler <- tuple[1]
                        if h !== nil then
                            r.run[h]
                        end if
                    end if
                end for
            end fireEvent

            export operation getTimeOfDay -> [ t : Time ]
                var secs, usecs : Integer
                secs, usecs <- self.iGetTimeOfDay
                t <- Time.create[secs, usecs]
            end getTimeOfDay

            export operation delay [ t : Time ]
                primitive "SYS" "JDELAY" 1 [ ] <- [ t ]
            end delay

            export operation waitUntil [ t : Time ]
                const sep : Time <- t - self.getTimeOfDay
                primitive "SYS" "JDELAY" 1 [ ] <- [ sep ]
            end waitUntil

            export operation getActiveNodes -> [ r : NodeList ]
                primitive "SYS" "GETACTIVENODES" 0 [ r ] <- [ ]
            end getActiveNodes

            export operation getAllNodes -> [ r : NodeList ]
                primitive "SYS" "GETALLNODES" 0 [ r ] <- [ ]
            end getAllNodes

            export operation getNodeInformation [ n : Node ] -> [ r : NodeListELement ]
                var incarnationTime : Time
                primitive "SYS" "JGETINCARNATIONTIME" 0 [incarnationTime] <- []
                r <- NodeListElement.create[self, true, incarnationTime, mylnn]
            end getNodeInformation

            export operation getLoadAverage -> [ r : Real ]
                primitive "SYS" "JGETLOADAVERAGE" 0 [ r ] <- [ ]
            end getLoadAverage

            export operation setDiscoveredNodeEventHandler [ h : Handler ]
                self.setEventHandler[EventType.DISCOVERED_NODE_EVENT, h]
            end setDiscoveredNodeEventHandler

            export operation setNodeEventHandler [ h : Handler ]
                self.setEventHandler[EventType.NODE_EVENT, h]
            end setNodeEventHandler

            export operation removeNodeEventHandler [ h : Handler ]
                if eventhandlers == nil then return end if
                const upb : Integer <- eventhandlers.upperbound
                const len : Integer <- upb + 1
                for i : Integer <- 0 while i < len by i <- i + 1
                    const tuple : VectorOfAny <- eventhandlers[i]
                    const th : Handler <- tuple[1]
                    if th == h then
                        tuple[0] <- nil
                        tuple[1] <- nil
                        return
                    end if
                end for
            end removeNodeEventHandler

            export operation nodeUp [n : Node, t : Time]
                const r <- object r
                    export operation run[ h : Handler ]
                        const invokeUp <- object invokeUp
                            process
                                h.nodeUp[n, t]
                            end process
                        end invokeUp
                    end run
                end r

                self.fireEvent[EventType.NODE_EVENT, r]
            end nodeUp

            export operation nodeDown [n : Node, t : Time]
                const r <- object r
                    export operation run[ h : Handler ]
                        const invokeUp <- object invokeDown
                            process
                                h.nodeDown[n, t]
                            end process
                        end invokeDown
                    end run
                end r

                self.fireEvent[EventType.NODE_EVENT, r]
            end nodeDown

            export operation discoveredNodeUp [n : Node, t : Time]
                const r <- object r
                    export operation run[ h : Handler ]
                        const invokeUp <- object invokeUp
                            process
                                h.nodeUp[n, t]
                            end process
                        end invokeUp
                    end run
                end r

                self.fireEvent[EventType.DISCOVERED_NODE_EVENT, r]
            end discoveredNodeUp

            export operation discoveredNodeDown [n : Node, t : Time]
                const r <- object r
                    export operation run[ h : Handler ]
                        const invokeUp <- object invokeDown
                            process
                                h.nodeDown[n, t]
                            end process
                        end invokeDown
                    end run
                end r

                self.fireEvent[EventType.DISCOVERED_NODE_EVENT, r]
            end discoveredNodeDown

            export operation getStdin -> [ result : InStream ]
                primitive "SYS" "GETSTDIN" 0 [result] <- []
            end getStdin

            export operation getStdout -> [ result : OutStream ]
                primitive "SYS" "GETSTDOUT" 0 [result] <- []
            end getStdout

            export function getLNN -> [result : Integer]
                result <- mylnn
            end getLNN

            export function getName -> [result : String]
                primitive "SYS" "GETNAME" 0 [result] <- []
            end getName

            export function getIncarnationTime -> [result : Time]
                primitive "SYS" "JGETINCARNATIONTIME" 0 [result] <- []
            end getIncarnationTime

            export operation getLocationServer -> [ l : Any ]
                primitive var "GETLOCSRV" [l] <- []
            end getLocationServer

            export operation setLocationServer [ l : Any ]
                primitive "SETLOCSRV" [] <- [l]
            end setLocationServer

            export operation mergeWith [ip : String, port : Integer]
                primitive "SYS" "JMERGEWITH" 2 [] <- [ip, port]
            end mergeWith
        end aNode
    end create
end Node

export Node to "Builtins"
