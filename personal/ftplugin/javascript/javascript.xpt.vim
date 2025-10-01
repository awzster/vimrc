XPTemplate priority=personal
XPTvar $SParg   ''

XPTvar $BRif    '\n'
XPTvar $BRel    \n
XPTvar $BRloop  '\n'
XPTvar $BRfun   '\n'
XPTvar $SPcmd   '\n'
XPTvar $BRstc    '\n'

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
/* -----------------------------------------
File    : `file()^
Author  : `$author^
Contact : `$email^
Date    : `date()^

Description : `cursor^
$Header: $
----------------------------------------- */


XPT try wrap=job
try {
    `job^
}
catch (err) { console.warn(`__CURSOR__: ${err}`); }


XPT log wrap
console.log(`cursor^);
XPT warn wrap
console.warn(`cursor^);

XPT val wrap
$('#`id^').val()

XPT .then
.then(`data^ => {
    `cursor^
});


XPT .map
.map(el => {
    `cursor^
});

XPT .filter
.filter(el => { return el.id == `cursor^; });

XPT .find
.find(el => { return el.id == `cursor^; });

XPT .some
.some(el => { return el.id == `cursor^ });

XPT .join
.map(el => el.id).join(',');

XPT =>
((`arg^) => { `cursor^ });

XPT time wrap=job
console.time('`timer^');
`job^
console.timeEnd('`timer^');

XPT tfunc wrap=name
this.`name^ = (`arg^) =>
{
    `cursor^
};

XPT jshintignore wrap=job
/* jshint ignore:start */
`job^
/* jshint ignore:end */

XPT swal-confirm
return new swal({
    title: 'Confirmarion',
    text: 'Are you sure to `question^?',
    icon: 'question',
    showCancelButton: true,
    confirmButtonText: 'OK',
    cancelButtonText: 'Cancel' }).then((value) => {
    if (value.isConfirmed)
    {
        `cursor^
    }
});

XPT swal-error
return new swal({ title: 'Error!', text: '`cursor^', icon: 'error' });

XPT swal-success
return new swal({ title: 'Success!', text: '`Success^', icon: 'success' }).then(() => {
    `cursor^
});

XPT swal-input
      return new swal({
        title: 'Clone program',
        input: 'text',
        inputLabel: 'Program name',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'OK',
        cancelButtonText: 'Cancel' }).then((value) => {
        if (value.isConfirmed && value.value)
        {
        `cursor^
    }
});

XPT join
this.`cursor^.map(el => el.id).join(',');

XPT join wrap=array
`array^.map(el => el.id).join(',');

XPT eslind-disable wrap=var
/* eslint-disable */
`var^
/* eslint-enable */

XPT assign
Object.assign(`this^, `data^);

XPT rendererClick
const `some^ = ({ data, value }) =>
{
    return data && !data.isTotal ?
        `<a href="javascript:void(0)" ng-click="vm.DlgOpen('${data.pos}')">${value}</a>` : value;
}
XPT rendererHref
const `some^ = ({ data, value }) =>
{
    return data && !data.isTotal ?
        `<a href="" target="_blank">${value}</a>` : value;
}
XPT rendererContext
const attrCellRenderer = ({ data, value, context }) =>
{
    // don't fogot this
    // this.gridOptions.context = { $scope: $scope };
    const link = document.createElement('a');
    link.href = 'javascript:void(0)';
    link.textContent = value;

    link.addEventListener('click', function() 
    {
        if (context && context.$scope) 
        {
            context.$scope.vm.attributeDlgOpen(data);
            if (!context.$scope.$$phase) 
            {
              context.$scope.$apply();
            }
        }
    });

    return link;
}


XPT forOwn
_.forOwn(this.`object^, (value, key) => {
    if (typeof(value) == 'string')
        `params^[key] = value;
});

XPT params
let params = utilsService.prepareParams(this.`cursor^);
Object.assign(params, { dtType: '`load^' });


XPT remapObiect
let keyMap = { `id^: 'id', `name^: 'name' };
`list^ = `list^.map(el => _.mapKeys(el, (value, key) => keyMap[key] || key));

XPT function wrap=function
this.`function^ = (`arg^) =>
{
  `cursor^
};

