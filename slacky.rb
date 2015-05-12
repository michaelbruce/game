#!/usr/bin/env ruby

require 'httmultiparty'
require 'trollop'

class Slacky
  include HTTMultiParty
  base_uri 'https://slack.com/api'

  def initialize(token)
    @token = token
  end

  def cli_ui
    puts 'Slacky alpha CLI'
    while input = STDIN.gets.chomp
      case input
      when input.include?("/send")
        puts "Sending message #{input} to AMA."
      when "/exit"
        puts "Goodbye."
        break;
      else
        puts 'You entered this: ' + input
      end
    end
  end

  def hi
    'hello there'
  end

  ## get a channel, group, im or user list
  def get_objects(method, key)
    self.class.get("/#{method}", query: { token: @token }).tap do |response|
      raise "error retrieving #{key} from #{method}: #{response.fetch('error', 'unknown error')}" unless response['ok']
    end.fetch(key)
  end

  def users
    @users ||= get_objects('users.list', 'members')
  end

  def auth
    @auth ||= get_objects('auth.test', 'user')
  end

  def groups
    @groups ||= get_objects('groups.list', 'groups')
  end

  def ims
    @ims ||= get_objects('im.list', 'ims')
  end

  ## translate a username into an IM id
  def im_for_user(username)
    user = users.find do |u|
      u['name'] == username
    end
    ims.find do |im|
      im['user'] == user['id']
    end
  end

  def send(message, channel)
    url = "https://slack.com/api/chat.postMessage"
    full_test_url = "https://slack.com/api/chat.postMessage?token=<token!>&channel=%23ama&text=hi%20slacky&username=myusername&pretty=1"
  end

end
