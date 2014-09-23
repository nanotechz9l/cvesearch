#!/usr/bin/env ruby

 require 'nokogiri';require 'open-uri';require 'rainbow/ext/string'

 def  banner()
 print """  
          =================================================================
          =================================================================
          ======= => Explot / CVE Search v 0.0.1                ===========
          =================================================================
          ======= Rick (nanotechz9l) Flores                     ===========
          ======= https://github.com/nanotechz9l                ===========
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

      #cveid, keyword, exploit_db = ARGV[0] //<-- doesnt work, it should!
      cveid       = ARGV[0]
      keyword     = ARGV[0]
      #exploit_db  = ARGV[0]

      
      # 1. Search via CVE Identifier
      cveid = Nokogiri.HTML(open("http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=#{cveid}"))       # CVE search
      ## CVE XPaths!
      #c = cveid.xpath('//*[@id="GeneratedTable"]').text # cveid
      #puts c
      
      
      # 2. Search via Vendor Keyword
      keyword = Nokogiri.HTML(open("http://www.cve.mitre.org/cgi-bin/cvekey.cgi?keyword=#{keyword}")) # Keyword search 
      ## Keyword XPaths! 
      #   Results                       //html/body/div/table/tr[2]/td[2]/div                 # to much fluff!
      #   Table (all)!                  //html/body/div/table/tr[2]/td[2]/div[2]/table        # works but misaligned!
      #   Table head (name/description) //html/body/div/table/tr[2]/td[2]/div[2]/table/thead  # vague
      #   Table body (number/details)   //html/body/div/table/tr[2]/td[2]/div[2]/table/tbody  # ?
      ## Keyword XPaths!
      #k = keyword.xpath('//html/body/div/table/tr[2]/td[2]/div[2]/table').text # keyword
      #puts k

      
      # 3. Search CVE via exploit-db.com
      #exploit_db = Nokogiri.HTML(open("http://www.exploit-db.com/search/?action=search&filter_page=1&filter_description=&filter_exploit_text=&filter_author=&filter_platform=0&filter_type=0&filter_lang_id=0&filter_port=&filter_osvdb=&filter_cve=#{exploit_db}"))
      #exploit_db = Nokogiri.HTML(open("http://www.exploit-db.com/search/?action=search&filter_page=1&filter_description=&filter_exploit_text=&filter_author=&filter_platform=0&filter_type=0&filter_lang_id=0&filter_port=&filter_osvdb=&filter_cve=2010-2204"))
      #e = exploit_db.xpath('.list_explot_description').text
      #puts e
      
      #res = Nokogiri::HTML(open("http://www.exploit-db.com/search/?action=search&filter_page=1&filter_description=&filter_exploit_text=&filter_author=&filter_platform=0&filter_type=0&filter_lang_id=0&filter_port=&filter_osvdb=&filter_cve=#{exploit_db}"))
      #puts res.text
