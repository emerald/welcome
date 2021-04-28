% Moves a welcomable object to the node it is connected to

% This test requires at least two nodes in the node graph

const foo <- welcomable object foo
    export op invokeMe
        (locate self)$stdout.putstring["I was invoked\n"]
    end invokeMe
end foo

const thrower <- object thrower
    const me <- locate self
    const all <- me$activenodes

    process
        stdout.putstring["Moving object away\n"]
        fix foo at all[1]$theNode
        stdout.putstring["Object moved\n"]
        (locate foo)$stdout.putstring["Object moved here\n"]
    end process
end thrower