% The intention of this program is to test whether the arguments given to
% the operations of the event handler work as intended. The Time object
% should work as normally, while only move-operations should be allowed on
% the Node object.

% This test requires at least two nodes in the local network, where one is
% discoverable.

const main <- object main
    const me <- locate self
    field newNode : Node

    process
        me$discoveredNodeEventHandler <-
            object myHandler
                export operation nodeUp[n : Node, t : Time]
                    stdout.putstring["A node with incarnation time " ||
                                      t.asString || " has been discovered\n"]
                    begin
                        stdout.putstring["Invoking the node object: "]
                        const now <- n$timeOfDay
                        stdout.putstring["success. Something is wrong\n"]

                        failure
                            stdout.putstring["failed as expected\n"]
                        end failure
                    end

                    main$newNode <- n
                end nodeUp

                export operation nodeDown[n : Node, t : Time]
                    stdout.putstring["A discovered node with incarnation time "
                                     || t.asString || " is no longer around\n"]
                    stdout.putstring["\nThe discovered node down event was " ||
                                    "triggered by the same node as the " ||
                                    "discovered node up event: " ||
                                    (n == main$newNode).asString || "\n"]
                end nodeDown
            end myHandler
    end process
end main