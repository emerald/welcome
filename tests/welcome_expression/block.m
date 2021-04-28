% The intention of this program is to test whether an welcoming process is
% blocking or not, if it is letting other processes run while waiting, and
% if it unblocks when welcoming an object.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: no programs
    % node 2: block.x

const WelcomableType <- typeobject WelcomableType
    op invokeMe
end WelcomableType

const foo <- welcomable object foo
    export op invokeMe
    end invokeMe
end foo

const main <- object main
    var startTime, endtime : Time
    const me <- locate self

    process
        startTime <- me$timeOfDay
        stdout.putstring["Starting time: " || startTime.asString || "\n"]

        const em <- welcome WelcomableType

        endTime <- me$timeOfDay
        stdout.putstring["End time: " || endTime.asString || "\n"]
        stdout.putstring["Time elapsed: " || (endTime - startTime).asString || "\n"]
    end process
end main

const thrower <- object thrower
    const me <- locate self
    const all <- me$activenodes

    process
        stdout.putstring["Moving object away\n"]
        fix foo at all[1]$theNode

        me.delay[Time.create[5, 0]]

        stdout.putstring["Moving object back\n"]
        refix foo at me
    end process
end thrower