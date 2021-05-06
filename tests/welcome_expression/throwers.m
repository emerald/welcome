% The intention of this program is to test whether a reference obtained using
% the welcome expression can be used to invoke the object.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: catcher.x
    % node 2: thrower.x

const Throwable <- welcomable class Throwable[name : String]
    export op invokeMe
        (locate self)$stdout.putstring[name || " was invoked\n"]
    end invokeMe
end Throwable

const thrower <- object thrower
    const me <- locate self
    const all <- me$activenodes
    var throwedObject : Throwable

    process
        for name in {"Alan", "Richard", "Edsger"}
            throwedObject <- Throwable.create[name]
            stdout.putstring["Moving " || name || " away\n"]
            fix throwedObject at all[1]$theNode
        end for
    end process
end thrower