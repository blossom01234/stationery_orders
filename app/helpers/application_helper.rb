module ApplicationHelper
    def code_select_options(code)
        array = []
        codes = CODE[code]
        array << ['選択してください', nil]
        codes.each do |key, value|
            array << [value, key]
        end
        array
    end
end
