XPTemplate priority=personal+

XPTvar $BRif     ''
XPTvar $BRel     \n
XPTvar $BRloop   ''
XPTvar $BRstc    ''
XPTvar $BRfun    ''
XPTvar $SPfun    ''
XPTvar $SParg    ' '
XPTvar $SPcmd    ' '
XPTvar $SPop     ' '

XPT (
(`cursor^)

XPT {
{`cursor^}

XPT [
[`cursor^]

XPT elsejsonComplex
else if (dtType.equals("`^"))
{
    sb.append("{");
    sb.append("\"`name1^\":" + ds.getList("call (:userId, :compCode)", userId, compCode, request) + ",");
    sb.append("\"`name2^\":" + ds.getList("call (:userId, :compCode)", userId, compCode, request) + "");
    sb.append("}");
}

XPT getList
else if (dtType.equals("`dtType^"))
{
    sb.append(ds.getList("call `^(:userId, :compCode, `^)", userId, compCode, request));
}

XPT getObject
else if (dtType.equals("`^"))
{
    sb.append(ds.getObject("call `^(:userId, :compCode, `^)", userId, compCode, request));
}

XPT getJSON
sb.append("\"`name1^\":" + ds.getList("call (:userId, :compCode)", userId, compCode, request) + "`,^");

XPT Update
else if (dtType.equals("`dtType^"))
{
    ds.Update("call `proc^(:userId, :compCode, `cursor^)", userId, compCode, request);
}

XPT getResult
    ArrayList data = new ArrayList();
    Hashtable<String, String> hash = new Hashtable<String, String>();
    data = ds.getResult("call `^(:userId, :compCode)", userId, compCode, request);
    hash = (Hashtable) data.get(0);

XPT hint
else if (dtType.equals("`cursor^"))
{
    java.util.ArrayList<java.util.Hashtable> list = ds.getResult("call `^(:userId, :compCode, `param^)", userId, compCode, request);
    String res = "<table class=\"table\"><thead><tr><th>#</th></tr></thead><body>";
    for (int i = 0; i < list.size(); i++)
    {
        Hashtable<String, String> o = (Hashtable <String, String>) list.get(i);
        res += "<tr><td>" + o.get( "pos") + "</td><td></tr>";
    }
    res += "</body></table>";
    response.setContentType("text/html; charset=UTF-8");
    out.clear();
    out.println("<div>" + res + "</div>");
    return;
}

XPT try wrap=job
try
{
    `job^
}
catch (Exception err) { com.asbis.util.Logger.log( '4za: `^: ' + err.getMessage(  )); }


XPT log
com.asbis.util.Logger.log( "\t4za: " + `^);

XPT html
else if (dtType.equals("getAdditionalHint"))
{
    java.util.ArrayList<java.util.Hashtable> list = ds.getResult("call hrm.procenter_pr_get(:userId, :compCode, :procenter_id, :type)", userId, compCode, request);
    String res = "";
    for (int i = 0; i < list.size(); i++)
    {
        Hashtable<String, String> o = (Hashtable <String, String>) list.get(i);
        res += "<li>" + o.get( "`name^") + "</li>";
    }
    response.setContentType("text/html; charset=UTF-8");
    out.clear();
    out.println("<ul style=\"line-height: 1.6rem;\">" + res + "</ul>");
    return;
}

XPT UMS
try
{
    com.it4profi.ums.helpers.UserInfo userInfo = new com.it4profi.ums.helpers.UserInfo(logininfo.getUSER_ID());
    com.it4profi.ums.EventProducer producer = new com.it4profi.ums.EventProducer();
    producer.setClass(1);
    producer.setCreator(getName(), request);
    producer.setReceiver(userInfo.email, userInfo.email);
    producer.setSender("reports@it4profit.com","IT4Profit reports");
    producer.setUserId(logininfo.getUSER_ID());
    producer.setEventProperty("USER_ID", logininfo.getUSER_ID());
    producer.setEventProperty("COMP_CODE", accessrights.getCOMP_CODE());
    producer.setEventProperty("ISO_LANG", (String)session.getValue("LANG"));
    producer.addSuject("`subject^");
    producer.addAttachmentSqlCsv("call `cursor^(:userId, :compCode)"
    ,""
    ,"Export.csv","Export.zip",',',false) ;
    producer.store(true, false);
}
catch (Exception e){
    out.clear();
}
return;

