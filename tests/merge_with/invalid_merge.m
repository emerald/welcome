% The intention of this program is to test whether a call to mergeWith will
% display an error message if it does not connect.

const main <- object main
    const me <- locate self

    process
        me.mergeWith["uio.no", 1234]
    end process
end main