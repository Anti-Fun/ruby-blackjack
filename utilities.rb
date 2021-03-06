# Frequently user console utilities

class Utilities
  class << self
    def clear_console
      system 'clear' or system 'cls'
    end

    def print_break
      puts "\n\n"
    end

    def pause
      sleep(1)
    end

    def wait_for_any_key
      begin
        system("stty raw -echo")
        str = STDIN.getc
      ensure
        system("stty -raw echo")
      end
    end

    def wait_for_instruction_key
      begin
        system("stty raw -echo")
        str = STDIN.getc
      ensure
        system("stty -raw echo")
      end
      if str == 'H' || str == 'h'
        return 'H'
      elsif str == 'S' || str == 's'
        return 'S'
      elsif str == 'L' || str == 'l'
        exit
      elsif str == 'T' || str == 't'
        return 'T'
      elsif str == 'W' || str == 'w'
        return 'W'
      elsif str == 'F' || str == 'f'
        return 'F'
      end
    end

    def yesno
      begin
        system("stty raw -echo")
        str = STDIN.getc
      ensure
        system("stty -raw echo")
      end
      if str == "Y"
        return true
      elsif str == "N"
        return false
      else
        raise "Invalid character."
      end
    end

    def flash(message, occurance)
      occurance.times do
        print "\r#{ message }"
        sleep 0.5
        print "\r#{ ' ' * message.size }"
        sleep 0.5
      end
    end

  end
end