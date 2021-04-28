% This program welcomes an object and invokes it

const WelcomableType <- typeobject WelcomableType
    op invokeMe
end WelcomableType

const catcher <- object catcher
    const me <- locate self

    process
        me$stdout.putstring["Welcoming object\n"]
        const em <- welcome WelcomableType
        me$stdout.putstring["Object welcomed\n"]
        em.invokeMe
    end process
end catcher