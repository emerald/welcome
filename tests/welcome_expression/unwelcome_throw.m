% The intention of this program is to test that unwelcome objects are not
% welcomed.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: catcher.x
    % node 2: unwelcome_throw.x

const foo <- object foo
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
    end process
end thrower