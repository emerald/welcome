% The intention of this program is to test whether a moved welcoming process can
% welcome objects on the destination node, and ignores welcome objects moved
% to its previous location.

% This test requires at least three nodes in the node graph, and should be run
% with the following programs:
    % node 1: no program
    % node 2: destination_welcome.x
    % node 3: catcher.x

const mobileCatcher <- object mobileCatcher
    process
        const a <- welcome Any
        (locate self)$stdout.putstring[nameof a || " was welcomed\n"]
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