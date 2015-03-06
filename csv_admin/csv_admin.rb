require 'green_shoes'

class CsvAdmin
  def initialize
    puts 'hello'

    Shoes.app {
      #banner(:text)
      #@text.style size: 12, markup: fg(@text.text, black), margin: 10
      edit_box width: 300, height: 22
      button 'Query'

      #stack do

      #end
      #
      flow do
        stack width: 200 do
          caption "Column one"
          para "is 200 pixels wide"
        end
        stack width: -200 do
          caption "Column two"
          para "is 100% minus 200 pixels wide"
        end
      end
    }

    #Shoes.app(title: "CSV Reader", width: 600, height: 400) do
    #  stack margin: 10 do
    #    stack margin: 10 do
    #      background gainsboro
    #      subtitle "Ever wanted to build a GUI?"
    #    end
    #  end
    #end
  end
end

CsvAdmin.new
