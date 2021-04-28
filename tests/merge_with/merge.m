% The intention of this program is to test the mergeWith operation. This
% program should be run with the nodeup.x-program, preferrably on all nodes 
% used in the test.

const main <- object main
    const me <- locate self
    const all <- me$activenodes
    var ip, foo : String
    var port : Integer

    process
        stdout.putstring["Starting with " || (all.upperbound + 1).asString ||
                         " active node(s)\n"]

        stdout.putstring["IP/hostname: "]
        me$stdout.flush
        ip, foo <- me$stdin$string.token["\n"]

        stdout.putstring["port: "]
        me$stdout.flush
        port <- Integer.literal[me$stdin$string]

        stdout.putstring["Merging with " || ip || " on port " || port.asString || "\n"]
        me.mergeWith[ip, port]
    end process
end main