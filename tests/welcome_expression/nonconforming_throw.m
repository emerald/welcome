% The intention of this program is to test that welcomable but non-conforming
% objects are not welcomed.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: catcher.x
    % node 2: nonconforming_throw.x

const foo <- welcomable object foo
    export op invokeFoo
        (locate self)$stdout.putstring["Foo was invoked\n"]
    end invokeFoo
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