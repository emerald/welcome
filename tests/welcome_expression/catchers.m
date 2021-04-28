% The intention of this program is to test whether multiple blocking processes
% can all be unblocked and obtain a reference to a monitor-object.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: catchers.x
    % node 2: monitor_throw.x

const CounterType <- typeobject CounterType
    op invokeMe
end CounterType

const catcher1 <- object catcher1
    const me <- locate self

    process
        me$stdout.putstring["Catcher 1 blocking on welcome\n"]
        const em <- welcome CounterType
        me$stdout.putstring["Catcher 1 welcomed object\n"]
        em.invokeMe
    end process
end catcher1

const catcher2 <- object catcher2
    const me <- locate self

    process
        me$stdout.putstring["Catcher 2 blocking on welcome\n"]
        const em <- welcome CounterType
        me$stdout.putstring["Catcher 2 welcomed object\n"]
        em.invokeMe
    end process
end catcher2

const catcher3 <- object catcher3
    const me <- locate self

    process
        me$stdout.putstring["Catcher 3 blocking on welcome\n"]
        const em <- welcome CounterType
        me$stdout.putstring["Catcher 3 welcomed object\n"]
        em.invokeMe
    end process
end catcher3