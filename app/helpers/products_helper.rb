module ProductsHelper
    def unit_ctov(code)
        if code == 0
            return '個'
        elsif code == 1
            return '枚'
        elsif code == 2
            return '台'
        end
    end
end
