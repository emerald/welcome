% The intention of this program is to test whether a call to mergeWith will
% display an error message if it does not connect.

const main <- object main
    const me <- locate self

    process
        stdout.putstring["Attempting to merge with ifi.uio.no:1234 ...\n"]
        me.mergeWith["ifi.uio.no", 1234]
        stdout.putstring["Merge attempt complete\n"]
    end process
end main