#require 'salesforce_data'
require 'java'

import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JTextField
import javax.swing.JTable
import java.awt.FlowLayout

class SoqlAdmin
end

class MainWindow < JFrame
  def initialize
    super "soqlAdmin"
    setDefaultCloseOperation JFrame::EXIT_ON_CLOSE

    #these two vars aren't java object[]s
    headers = ["Id","Name","Email","OwnerId"].to_java(:object)
    data = [
      [001, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java,
      [002, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java,
      [003, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java,
      [004, "Johnny", "johnny@walker.com", "A5dre0000did"].to_java
    ].to_java
    JTable table = JTable.new(data, headers)

    panel = JPanel.new(FlowLayout.new(FlowLayout::CENTER))
    data_panel = JPanel.new(FlowLayout.new(FlowLayout::CENTER))
    input = JTextField.new(10)
    button = JButton.new("Encrypt")
    output = JTextField.new(10)

    panel.add input
    panel.add button
    panel.add output

    data_panel.add table

    button.add_action_listener do|e|
      output.text = input.text.upcase
    end

    add panel
    setSize 300, 300

    add data_panel
    setSize 300, 300

    setVisible true
  end
end

MainWindow.new

