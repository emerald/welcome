% The intention of this program is to test whether multiple processes will
% obtain different object references when welcoming through a monitor object.

% This test requires at least two nodes in the node graph, and should be run
% with the following programs:
    % node 1: monitor_catchers.x
    % node 2: throwers.x

const WelcomableType <- typeobject WelcomableType
    op invokeMe
end WelcomableType

const myMonitor <- monitor object myMonitor
    const me <- locate self
    var number : Integer <- 1

    export operation welcomeCounter -> [c : WelcomableType]
        me$stdout.putstring["Welcoming object " || number.asString || "\n"]
        c <- welcome WelcomableType
        me$stdout.putstring["Object " || number.asString || " welcomed\n"]
        number <- number + 1
    end welcomeCounter
end myMonitor

const catcher1 <- object catcher1
    const me <- locate self

    process
        const em <- myMonitor.welcomeCounter
        em.invokeMe
    end process
end catcher1

const catcher2 <- object catcher2
    const me <- locate self

    process
        const em <- myMonitor.welcomeCounter
        em.invokeMe
    end process
end catcher2

const catcher3 <- object catcher3
    const me <- locate self

    process
        const em <- myMonitor.welcomeCounter
        em.invokeMe
    end process
end catcher3