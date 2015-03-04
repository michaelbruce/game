#require 'salesforce_data'
require 'java'

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JTextField
import javax.swing.JTable
import javax.swing.JSplitPane
import java.awt.FlowLayout

class SoqlAdmin
end

class MainWindow < JFrame
  def initialize
    super "soqlAdmin"
    setDefaultCloseOperation JFrame::EXIT_ON_CLOSE

#    #these two vars aren't java object[]s
#    headers = ["Id","Name","Email","OwnerId"].to_java(:object)
#    data = [
#      [001, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java,
#      [002, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java,
#      [003, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java,
#      [004, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java
#    ].to_java
#    JTable table = JTable.new(data, headers)

    data_panel = JPanel.new(FlowLayout.new(FlowLayout::CENTER))
    #panel = JPanel.new(FlowLayout.new(FlowLayout::CENTER))
    #input = JTextField.new(10)
    #button = JButton.new("Encrypt")
    #output = JTextField.new(10)

    #panel.add input
    #panel.add button
    #panel.add output

    #data_panel.add table
    test_table = javax.swing.table.DefaultTableModel.new
    test_table.add_column("Id")
    test_table.add_column("Name")
    test_table.add_column("Email")
    test_table.add_column("OwnerId")
    test_table.add_row(["1","Johnny","johnny@walker.com","9A40040403IA"].to_java)
    test_table.add_row(["2","Johnny","johnny@walker.com","9A40040403IA"].to_java)
    test_table.add_row(["3","Johnny","johnny@walker.com","9A40040403IA"].to_java)
    test_jtab = JTable.new(test_table)
    data_panel.add test_jtab

    #button.add_action_listener do|e|
    #  output.text = input.text.upcase
    #end

    split = JSplitPane.new(JSplitPane::VERTICAL_SPLIT)

    #add panel
    #setSize 300, 300
    entry_panel = create_entry_panel
    split.setTopComponent(entry_panel)
    setSize 300, 300
    setVisible true

    split.setBottomComponent(data_panel)
    setLocation 0, 300
    setSize 300, 300
    setVisible true

    add split
    setSize 300, 300
    setVisible true
  end

  def create_entry_panel
    panel = JPanel.new(FlowLayout.new(FlowLayout::CENTER))
    input = JTextField.new(10)
    panel.add input
    panel
  end
end

MainWindow.new

