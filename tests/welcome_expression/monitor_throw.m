% Moves a welcomable monitor object to another node. Requires at least two
% nodes in the node graph to run.

const counter <- welcomable monitor object counter
    var invokeCount : Integer <- 0

    export op invokeMe
        invokeCount <- invokeCount + 1
        (locate self)$stdout.putstring["I have been invoked " ||
                                        invokeCount.asString || " time(s)\n"]
    end invokeMe
end counter

const thrower <- object thrower
    const me <- locate self
    const all <- me$activenodes

    process
        stdout.putstring["Moving counter away\n"]
        fix counter at all[1]$theNode
        stdout.putstring["Counter moved\n"]
    end process
end thrower