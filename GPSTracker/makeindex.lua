file.chdir(cfg['gpx_dir'])
local fd = file.open('index.html', "w")

if fd then
  fd.writeline("<!doctype html>")
  fd.writeline("<html lang=\"en\">")
  fd.writeline("<head>")
  fd.writeline("<meta charset=\"UTF-8\">")
  fd.writeline("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">")
  fd.writeline("<title>ESP8266 GPS Tracker v0.1</title>")
  fd.writeline(" <style>")
  fd.writeline("  body {margin: 0; font-family: Arial;}")
  fd.writeline("  label {display: block; margin-top:10px; font-size: 14px;}")
  fd.writeline("  input, select {display: block; width: 100%; height: 22px;}")
  fd.writeline("  header {display:block; width: 100%; padding:7px 10px; background-color: #008080; color: #fff; font-weight: bold; text-align: center;}")
  fd.writeline("  img {vertical-align:middle;}")
  fd.writeline("  .main {min-height: 50px;}")
  fd.writeline("  .block-content {background-color: #EFEFEF; margin: 10px auto; min-width: 310px; max-width: 360px; width: 95%;}")
  fd.writeline("  .b_title {background-color: #D0DDE3; padding: 7px 10px; text-align: center; color: #637B85; font-size: 16px; font-weight: bold;}")
  fd.writeline("  .b_content {padding: 3px 10px;}")
  fd.writeline("  .btn { margin-bottom: 5px; float: right; background: #5CB85C; border: 1px solid #398439; color: #fff; height: 30px; padding: 6px 12px; box-shadow: 0 1px 0 #006799; border-radius: 4px;}")
  fd.writeline("  .btn:hover {background: #449d44;}")
  fd.writeline("  .btn_delete { margin-bottom: 5px; float: right; background: #E80000; border: 1px solid #398439; color: #fff; height: 30px; padding: 6px 12px; box-shadow: 0 1px 0 #006799; border-radius: 4px;}")
  fd.writeline("  .btn_delete:hover {background: #CC0000}")
  fd.writeline("  .b_clear {clear: both; height: 3px;}")
  fd.writeline("  footer {display:block; width: 100%; padding:7px 10px; background-color: #CEB713; color: #fff; text-align: center;}")
  fd.writeline("  table {width: 100%; margin: 0; padding: 0;}")
  fd.writeline("  th {border:1px dotted #C0C0C0; margin: 0; padding: 2px; background-color: #D8D8D8; color: #808080}")
  fd.writeline("  td {border:1px dotted #C0C0C0; margin: 0; padding: 2px;}")
  fd.writeline("  a{color: #008000; text-style: bold; font-weight: bold;}")
  fd.writeline(" </style>")
  fd.writeline(" <script language=\"JavaScript\">")
  fd.writeline("  function delfile(fname){")
  fd.writeline("   if (confirm('Delete file '+fname+' ?')) {")
  fd.writeline("   window.location.href='/?delete='+fname;")
  fd.writeline("  }")
  fd.writeline(" }")
  fd.writeline(" </script>")
  fd.writeline("</head>")
  fd.writeline("<body>")
  fd.writeline(" <header>ESP8266 GPS Tracker v0.1  <a href=\"settings.html\"><img src=\"settings.png\" width=\"24\" height=\"24\" alt=\"Settings...\" title=\"Settings...\" border=\"0\"></a></header>")
  fd.writeline(" <div class=\"main\">")
  fd.writeline("  <div class=\"block-content\">")
  fd.writeline("   <div class=\"b_title\">GPX Files list</div>")
  fd.writeline("   <div class=\"b_content\">")
  fd.writeline("<table>")
  fd.writeline("<tr><th>File</th><th>Size</th><th>&nbsp;</th></tr>")
  
  l = file.list();
  for k,v in pairs(l) do
    if (k:match("^.+(%..+)$") == '.gpx') then
      fd.write("<tr><td><a href=\"map.html?file="..k.."\">"..k.."</a></td><td>"..v.."</td><td>")
      fd.write("<input type=\"submit\" value=\"Download\" class=\"btn\" onclick=\"window.location.href='"..k.."'\">")
      fd.write("<input type=\"submit\" value=\"Delete\" class=\"btn_delete\" onclick=\"delfile('"..k.."')\">")
      fd.writeline("</td></tr>")
    end
  end

  fd.writeline("</table>")
  fd.writeline("   </div>")
  fd.writeline("  </div>")
  fd.writeline(" </div>")
  fd.writeline(" <footer>&copy; Andrey Koryagin 2017. Ukraine, Kremenchug</footer>")
  fd.writeline("</body>")
  fd.writeline("</html>")
 fd.close()
end
fd = nil
file.chdir('/FLASH')
collectgarbage()
