require 'net/http'

uri = URI('https://getsupport.apple.com/web/v2/takein/timeslots')
req = Net::HTTP::Post.new(uri)
req.body = '{"store":"R608"}'
req.content_type = 'application/json;charset=utf-8'

found = false

while found == false do
  req['X-Apple-CSRF-Token'] = "FNqYSJrGnB0xjKIlMjH9HxqV/Hs="
  req['Cookie'] = 's_fid=295B636E704AA338-34F168A932E4274D; s_vnum_n2_br=20%7C12; s_vi=[CS]v1|2B1484F585010B8D-400001044001F45A[CE]; CAS=pt~BR; POD=br~pt; s_vnum_n2_us=4%7C16%2C19%7C1%2C21%7C1; dslang=US-EN; acn01=4W1ZvWTxNp24ehsDe29AqfqARxQOXsvLzrzwXkUloQCMZBNzQweS; recent=ln0WCMeFNrb71d00a9hxTgQi+MJcnfMl4TOCNr79guFRV5OvSt8XqQsNe+a9adDZa3tb+yaPyeJTDW7bXTBeSOxvNG6IEnAThjQa9/sc9GWMGVLzdBqhYST0eOjotV+Eg26vaR+Ju9n9eM9gWLJpCvhQ9+bd6kceH8B6iezVL67+97RF2YmBrr92XFhhZG3aE3WygMbuyZOKm+MhEKWkBQMPwKSmNhZ1tds2ErNGmz2qeawc7ylshyyhCj6C6S+o9gs+OaAkPnjBiGllTO3Nthikprk6L3tfoToa3PAGa1gpJ8t4yZeq8zGxTxzdg692/trbSAUkuoXpeO4q9xVJy1wZbbHc3FGzvZrS6Sp3MKJHaelJeV+NO6aXuF0dBhMW3VhjViInOcYQtfwO4KHFmpgTTeOCEdoMkckLBNyLJsvctEX8DkAT6/Jwmb1CmNheV/IKrySO7wYVaieFGW7804sO/a8jigbz0i0f3LrzTrgLu5xKtpCRjZolPK01C4R2zmBC2aIC3ypQWlGTxnzdYPN1L78kpr14khzBvHGy0nFh8Kj5pDrMmVaf6Yf/9JNuBYxKxTxWypVqqLU3DMSOVXWcf66SmvJMnIof8eq5AHD0hRDemXo6snAdZvJWzd2qTTXVREAi0IOZPNxkSRR9aCr66cFznXYBDAoMzx81zWRanWD3qY5+lGSoQy2/mbmTYFsO5di/7+oUl4yCBmaH9g==.OaFL1S+VV8idD0gHEHPJ2mhfRSXykq7n1qVrJxctm+c=; dssf=1; ccl=SnX1VMErYjQ0D92xDD3Zig==; geo=BR; s_cc=true; s_ppv=CAS%253A%2520Default%2520Page%2520Load%2520Rule%2520%2528No%2520Default%2520Pageview%2529%2C84%2C47%2C1266%2C100%3A%3E%7C200%3A%3E%7C300%3A%3E%7C400%3A%3E%7C500%3A%3E%7C600%3A%3E%7C700%3A%3E%7C800%3A2%7C900%3A2%7C1000%3A2%7C1100%3A2; s_orientation=%5B%5BB%5D%5D; s_pathLength=retailstore%3D1%2Csupport%3D1%2C; s_invisit_n2_br=20; s_sq=%5B%5BB%5D%5D; s_orientationHeight=1266; JSESSIONID=1oz7ip7o77cue1kiss84th9hmf; NSC_MCWT_hfutvqqpsu-bt-oxl.dpsq_443=ffffffff1268228845525d5f4f58455e445a4a4212d3; NSC_MCWT_psjhjo-hfutvqqpsu-oxl_443=ffffffff129f995f45525d5f4f58455e445a4a423393; s_invisit_n2_us=4'
  req['Host'] = 'getsupport.apple.com'
  req['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0'

  http = Net::HTTP.new(uri.hostname, uri.port)
  http.use_ssl = true
  res = http.request(req)

  puts res.body

  unless res.body.include?("Escolha uma loja diferente")
    found = true
    puts Time.now
  end

  5.times do
    sleep 1
    puts "."
  end
end
