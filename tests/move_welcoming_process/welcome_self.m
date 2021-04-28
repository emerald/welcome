% The intention of this program is to test whether a welcoming process can
% welcome itself when moved.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: no program
    % node 2: welcome_self.x

const mobileCatcher <- welcomable object mobileCatcher
    process
        const a <- welcome Any
        (locate self)$stdout.putstring["Self was welcomed\n"]
    end process
end mobileCatcher

const thrower <- object thrower
    const me <- locate self
    const all <- me$activenodes

    process
        fix mobileCatcher at all[1]$theNode
        stdout.putstring["Mobile catcher moved\n"]
    end process
end thrower