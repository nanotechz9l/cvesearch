#!/usr/bin/env ruby

 require 'nokogiri'
 require 'open-uri'
 require 'rainbow'

 def  banner()
 print """  
          =================================================================
          =================================================================
          ======= => CVE Identifier, and Keyword Search v 0.0.1 ===========
          =================================================================
          ======= ~> by Rick (nanotechz9l) Flores               ===========
          ======= ~> 0xnanoquetz9l<v>gmail                      ===========
          ======= ~> https://github.com/nanotechz9l             ===========
          ======= ~> https://twitter.com/nanotechz9l            ===========
          =================================================================
          =================================================================

  """.foreground(:red).bright
      end
      banner()

  def parse(www)

      rescue
      print "\t\t[*]Error: #{$!}\n"
      exit(0)
      end

  def assist()
      end

      if not ARGV[0]
      assist()
      puts "This program can be used to search for CVE's via Identifier, and or CVE Vendor Keywords <see below>.".foreground(:white).bright
      puts " \n Ex 1:".foreground(:cyan).bright + " #{$0} adobe".foreground(:yellow).bright
      puts " Ex 2:".foreground(:cyan).bright + " #{$0} cve-2008-4250 \n".foreground(:yellow).bright
      exit(0)
      end

      cveid    = ARGV[0]
      keyword  = ARGV[0]

      # Search via CVE Identifier
      cveid = Nokogiri.HTML(open("http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=#{cveid}"))       # CVE search

      # Search via Vendor Keyword
      keyword = Nokogiri.HTML(open("http://www.cve.mitre.org/cgi-bin/cvekey.cgi?keyword=#{keyword}")) # Keyword search 

      ## Keyword XPaths! 
      #   Results                       //html/body/div/table/tr[2]/td[2]/div                 # to much fluff!
      #   Table (all)!                  //html/body/div/table/tr[2]/td[2]/div[2]/table        # works but misaligned!
      #   Table head (name/description) //html/body/div/table/tr[2]/td[2]/div[2]/table/thead  # vague
      #   Table body (number/details)   //html/body/div/table/tr[2]/td[2]/div[2]/table/tbody  # ?

      ## CVE XPaths!
      c = cveid.xpath('//*[@id="GeneratedTable"]').text # cveid

      ## Keyword XPaths!
      k = keyword.xpath('//html/body/div/table/tr[2]/td[2]/div[2]/table').text # keyword
      puts k
