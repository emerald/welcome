% The intention of this program is to test whether a welcoming process continues
% to block after it has been moved. If the print statement executes, the
% mobileCatcher process has resumed.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: no program
    % node 2: block.x

const mobileCatcher <- object mobileCatcher
    process
        const a <- welcome Any
        (locate self)$stdout.putstring["Something was welcomed\n"]
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