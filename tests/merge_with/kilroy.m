const Kilroy <- object Kilroy
    const home <- locate self

    process
        (locate self)$stdout.putstring["Press enter to start Kilroy\n"]
        const foo <- home$stdin$string
        
        const all <- home$activenodes
        for e in all
            refix self at e$theNode
            (locate self)$stdout.putstring["Kilroy was here\n"]
        end for
        refix self at home
    end process
end Kilroy