% The intention of this program is to test whether welcomable objects attached
% to a moved unwelcome object is welcomed.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: catcher.x
    % node 2: attached.x

const main <- object main
    const me <- locate self
    const all <- me$activenodes
    attached const foo <- welcomable object foo
        export op invokeMe
            (locate self)$stdout.putstring["I was invoked\n"]
        end invokeMe
    end foo

    process
        me$stdout.putstring["Moving self\n"]
        fix self at (locate self)$activeNodes[1]$theNode
        (locate self)$stdout.putstring["I am here now\n"]
    end process
end main