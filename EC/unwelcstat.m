export unwelcstat

const unwelcstat <- class unwelcstat (Tree) [xxexp : Tree, xxop : Ident]
    field exp     : Tree <- xxexp
    field xop     : Ident <- xxop

    export function upperbound -> [r : Integer]
        r <- 0
    end upperbound
    export function getElement [i : Integer] -> [r : Tree]
        if i == 0 then
            r <- exp
        end if
    end getElement
    export operation setElement [i : Integer, r : Tree]
        if i = 0 then
            exp <- r
        end if
    end setElement
    export operation copy [i : Integer] -> [r : Tree]
        var nexp : Tree
        if exp !== nil then nexp <- exp.copy[i] end if
        r <- unwelcstat.create[ln, nexp, xop]
    end copy

    export operation resolveSymbols[thest : SymbolTable, nexp : Integer]
        var child : Tree
        const limit <- self.upperbound
        var ch : Integer <- 0
        loop
            exit when ch > limit
            child <- self[ch]
            if child !== nil then
                child.resolveSymbols[thest, 1]
            end if
            ch <- ch + 1
        end loop
    end resolveSymbols

    export operation generate [ xct : Printable ]
        const bc <- view xct as ByteCode

        bc.pushSize[4]
        exp.generate[bc]
        bc.popSize

        if xop$name = "unwelcome" then
            bc.addCode["UNWELCOME"]
        elseif xop$name = "rewelcome" then
            bc.addCode["REWELCOME"]
        else
            assert false
        end if

    end generate

    export function asString -> [r : String]
        r <- xop$name||"stat"
    end asString
end unwelcstat
