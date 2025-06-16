XPTemplate priority=personal
XPTvar $SParg   ''

XPTvar $BRif    ''
XPTvar $BRel    \n
XPTvar $BRloop  '\n'
XPTvar $BRstc   ''
XPTvar $BRfun   ''
XPTvar $SPcmd   ''
XPTvar $DATE_FMT     '%d/%m/%Y'

XPTvar $author 'za'
XPTvar $email 'za@e-vision.by'


XPTinclude
      \ javascript/angular

" ========================= Function and Variables =============================
"XPT try wrap=job " try {..} catch {..} finally
"XSET dealError=/* error handling */
"XSET job=$VOID_LINE
"try`$BRif^{
"    `cursor^
"}
"catch (`err^)`$BRif^{
"    `dealError^
"}



" ================================= Snippets ===================================

XPT cmt " /** @auth... */
XSET author=$author
XSET email=$email
/**
* @author : `za^ | `za@e-vision.by^
* @description
*     `cursor^
* @return {`Object^} `desc^
*/


XPT cpr " @param
@param {`Object^} `name^ `desc^


" file comment
" 4 back slash represent 1 after rendering.
XPT fcmt " full doxygen comment
/*-----------------------------------------
File    : `file()^
Author  : `$author^
Contact : `$email^
Date    : `date()^

Description : `cursor^
$Header: $
-----------------------------------------*/


XPT try wrap=job
try
{
    `job^
}
catch (err) { window.console.warn( '`cursor^: ' + err); }


XPT log wrap
window.console.log(`cursor^);
XPT warn wrap
window.console.warn(`cursor^);

XPT val wrap
$("#`id^").val()

XPT .then
.then((data) => { 
    `cursor^ 
});


XPT .map
.map((el) => { 
    `cursor^ 
});

XPT .filter
.filter((el) => { return el.id == `cursor^; });

XPT .find
.find((el) => { return el.id == `cursor^; });

XPT .some
.some((el) => { return el.id == `cursor^ });

XPT =>
((`arg^) => { `cursor^ });

XPT time wrap=job
window.console.time('`timer^');
`job^
window.console.timeEnd('`timer^');

XPT tfunc wrap=name
this.`name^ = function(`arg^)
{
    `cursor^
};
        
XPT jshintignore wrap=job
/* jshint ignore:start */
`job^
/* jshint ignore:end */

XPT isArray wrap=var
_.isArray(`var^)? `var^: [];

XPT param wrap=var
`var^? `var^.id: ''

XPT swal-confirm
swal({ title: "Confirmarion`^", text: "Are you sure to `^?", icon: "warning",
    buttons: { yes: { text: "Yes", value: true }, cancel: "No" } }).then((value) => {
    if (value)
    {
        `cursor^
    }
});

XPT swal-error
return swal('Error!', '`cursor^', 'error');

XPT swal-success
swal('Success!', '`cursor^', 'success');

XPT swal-input
swal("`^:", { content: "input",  
    buttons: { confirm: { text: "Save" }, cancel: { text: "Cancel",  visible: true } } }).then((value) => {
    if (!value)
        return false;

    `cursor^
});

XPT eslind-disable wrap=var
/* eslint-disable */
`var^
/* eslint-enable */


