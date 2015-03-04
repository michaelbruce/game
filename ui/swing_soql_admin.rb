#require 'salesforce_data'
require 'java'

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JTextField
import javax.swing.JTextArea
import javax.swing.JTable
import javax.swing.JSplitPane
import javax.swing.JScrollPane
import java.awt.FlowLayout
import java.awt.GridBagConstraints

class SoqlAdmin
end

class MainWindow < JFrame
  def initialize
    super "soqlAdmin"
    setDefaultCloseOperation JFrame::EXIT_ON_CLOSE

    split = JSplitPane.new(JSplitPane::VERTICAL_SPLIT)

    entry_panel = create_entry_panel
    split.setTopComponent(entry_panel)
    setSize 300, 300
    setVisible true

    data_panel = create_data_panel
    split.setBottomComponent(data_panel)
    setLocation 0, 300
    setSize 300, 300
    setVisible true

    add split
    setSize 300, 300
    setVisible true
  end

  def create_data_panel
    data_panel = JPanel.new(FlowLayout.new(FlowLayout::CENTER))
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
    data_panel
  end

  def create_entry_panel
    panel = JPanel.new(FlowLayout.new(FlowLayout::CENTER))
    scroll_pane = JScrollPane.new()
    constraints = GridBagConstraints();
    constraints.weightx = 1.0;
    constraints.weighty = 1.0;
    input = JTextArea.new(3,20)
    input.setEditable true
    input.setText 'select * from Contacts'
    panel.add input
    panel
  end
end

MainWindow.new

#spare jruby/swing example code
    #panel.add input
    #panel.add button
    #panel.add output

    #data_panel.add table

    #button.add_action_listener do|e|
    #  output.text = input.text.upcase
    #end
