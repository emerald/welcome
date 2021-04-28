% The intention of this program is to test two consecutive mergeWith operations.
% This program should be run with the nodeup.x-program, preferrably on all nodes
% used in the test. One of the nodes in another graph should run kilroy.x

% The consecutive mergeWith operations are expected to not result in a complete
% node graph. This can be tested by creating three node graphs:
    % Graph 1:
        % Node 1: nodeup.x
        % Node 2: nodeup.x
    % Graph 2:
        % Node 1: nodeup.x
        % Node 2: nodeup.x kilroy.x
    % Graph 3:
        % Node 1: nodeup.x
        % Node 2: concurrent_merge.x nodeup.x

const main <- object main
    const me <- locate self
    const all <- me$activenodes
    var ip1, ip2, foo : String
    var port1, port2 : Integer

    process
        stdout.putstring["Starting with " || (all.upperbound + 1).asString ||
                         " active node(s)\n"]

        stdout.putstring["IP/hostname 1: "]
        me$stdout.flush
        ip1, foo <- me$stdin$string.token["\n"]

        stdout.putstring["port 1: "]
        me$stdout.flush
        port1 <- Integer.literal[me$stdin$string]

        stdout.putstring["IP/hostname 2: "]
        me$stdout.flush
        ip2, foo <- me$stdin$string.token["\n"]

        stdout.putstring["port 2: "]
        me$stdout.flush
        port2 <- Integer.literal[me$stdin$string]

        stdout.putstring["Merging with " || ip1 || " on port " || port1.asString || "\n"]
        stdout.putstring["Merging with " || ip2 || " on port " || port2.asString || "\n"]

        me.mergeWith[ip1, port1]
        me.mergeWith[ip2, port2]
    end process
end main