//Variáveis globais usadas nas rotinas JS

var decres = 0;


function formataCampo(obj, mask) { 
	var i = obj.value.length; 
	var saida = mask.substring(0,1); 
	var texto = mask.substring(i);
	if (texto.substring(0,1) != saida) { 
		obj.value += texto.substring(0,1); 
	} 
}

function soNumero(e) { 
	if (document.all) // Internet Explorer
		var tecla = event.keyCode;
	else if(document.layers) // Nestcape
		var tecla = e.which;
		if (tecla > 47 && tecla < 58) // numeros de 0 a 9
			return true;
		else
			{
				if (tecla != 8) // backspace
					event.keyCode = 0;
					//return false;
				else
					return true;
			}
}

function validaData(IN_objeto, IN_msg){
	IN_objeto.onkeypress = function () {
		return soNumero(event);
	}
	
	IN_objeto.onkeyup = function (){
		return botaBarra(IN_objeto); 
	}
	
	IN_objeto.onblur = function () { 
		if (IN_objeto.value != ''){
			if (criticaData(IN_objeto.value) == false){
				alert(IN_msg);
				IN_objeto.focus();
				return false;
			}
		}
	}
}

function botaBarra(IN_objeto){
	if (IN_objeto.value.length != 2 && IN_objeto.value.length != 5)
		if (IN_objeto.value.substr(IN_objeto.value.length-1,IN_objeto.value.length) == "/")
			IN_objeto.value = IN_objeto.value.substr(0,IN_objeto.value.length-1);

	if (IN_objeto.value.length == 2 || IN_objeto.value.length == 5) 
		IN_objeto.value = IN_objeto.value + "/";


	if (IN_objeto.value.length == 3 || IN_objeto.value.length == 6)
		if (IN_objeto.value.substr(IN_objeto.value.length-2,IN_objeto.value.length) == "//")
			IN_objeto.value = IN_objeto.value.substr(0,IN_objeto.value.length-2);
}

function criticaData(strinput)	
{
	if (strinput == ''){
		retorno = false;
	}
	
	var barra1;
	var barra2;
	var parte1;
	var parte2;
	var partedia;
	var partemes;
	var parteano;
	var retorno;
	var restobisexto;
	var arrayultimodia;
	var datagerada;
	parte1=strinput.substr(0,3);
	barra1 = parte1.search("/");
	
	
	if (barra1 > 0 )
	{
			if (barra1 == 1) 
			{	
				partedia = "0" + parte1.substr(0,barra1);
			}
			else
			{
				partedia =  parte1.substr(0,barra1);
			}
			parte2=strinput.substr(barra1 + 1,3);
			barra2 = parte2.search("/");
			if (barra2 > 0)
			{
				
				if (barra2 == 1) 
				{	
					partemes = "0" + parte2.substr(0,barra2);
				}
				else
				{
					partemes =  parte2.substr(0,barra2);
				}
				parteano = strinput.substr(1 + barra1 + barra2 + 1);
				
				if (parteano.length == 2)
				{
					
					if (parseInt(parteano) > 50)
					{
						parteano = 19 + parteano;
					}
					else
					{
						parteano = 20 + parteano;
					}
					restobisexto = parteano % 4;
					if (restobisexto != 0)
					{
						arrayultimodia = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
					}
					else
					{
						arrayultimodia = new Array(31,29,31,30,31,30,31,31,30,31,30,31);
					}
					if (partemes > 0) 
					{
						if (partemes <= 12)
						{
							if (partedia > 0)
							{
								if (partedia <= arrayultimodia[partemes-1])
								{
									datagerada = new Date(parseInt(parteano),parseInt(partemes), parseInt(partedia));
									if (datagerada)
									{
										retorno = true;
									}
								}
								else
								{
									retorno = false;
								}
							}
							else
							{
								retorno = false;
							}
						}
						else
						{
							retorno = false;
						}
					}
					else
					{
						retorno = false;
					}
							
				}
				else
				{
					if (parteano.length == 4)
					{	
						restobisexto = parteano % 4;
						if (restobisexto != 0)
						{
							arrayultimodia = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
						}
						else
						{
							arrayultimodia = new Array(31,29,31,30,31,30,31,31,30,31,30,31);
						}
						if (partemes > 0) 
						{
							if (partemes <= 12)
							{
								if (partedia > 0)
								{
									if (partedia <= arrayultimodia[partemes-1])
									{
										datagerada = new Date(parseInt(parteano),parseInt(partemes), parseInt(partedia));
										if (datagerada)
										{
											retorno = true;
										}										
									}
									else
									{
										retorno = false;
									}
								}
								else
								{
									retorno = false;
								}
							}
							else
							{
								retorno = false;
							}
						}
						else
						{
							retorno = false;
						}
					}
					else 
					{
						// ano com tamanho diferente de 2 e 4
							retorno = false;
					}
				}
			}			
			else
			{
				// nao achou a segunda barra ou está na terceira posicao
				retorno = false;
			}
	}
	else
	{
		// nao achou a primeira barra ou está na primeira posicao
		retorno = false;
	}
	return retorno;
}
 

//Grupo de funções responsáveis pela ordenação das colunas nos grids

function lerConteudoCelula (td) {

  var r = '';

  for (var c = 0; c < td.childNodes.length; c++) 

    if (td.childNodes[c].nodeType == 3) 

      r += td.childNodes[c].nodeValue;

  return r;

}

 

function ordenarTabela (th, type, ind)

{

  var tbl = th.parentNode;

  while ((tbl.nodeName != 'TABLE') && (tbl.nodeName != 'table'))

    tbl = tbl.parentNode;

  tbody = tbl.tBodies[0];

  var pos = th.cellIndex;

  if (pos < 0) 

    pos = ind;

  var rows = tbody.rows;

  var asc = decres;

  for (var r = 0; r < rows.length - 1; r++) 

    for (var s = 0 ; s < rows.length - 1 - r; s++)

    {

      var v1 = lerConteudoCelula (rows[s].cells[pos]);

      var v2 = lerConteudoCelula (rows[s + 1].cells[pos]);

 

      if (type == String)

         {

         v1 = v1;

         v2 = v2;

         }

      else if (type == Number)

         {

         v1 = parseFloat(alterarNumeros(v1,0)); 

         v2 = parseFloat(alterarNumeros(v2,0)); 

         }

      else

         {

         v1 = parseFloat(alterarDatas(v1));

         v2 = parseFloat(alterarDatas(v2));

         }

 

         if (asc == 0)

         {

            if (v1 > v2)

            {

               var r1 = rows[s];

               var rowCopy = rows[s].cloneNode(true); 

               tbody.deleteRow(s);

               if (s + 1 < rows.length)

                  tbody.insertBefore(rowCopy , rows[s + 1]);

               else

                  tbody.appendChild(rowCopy);

            }

         decres = 1;

         }

         else

         {

            if (v1 < v2)

            {

               var r1 = rows[s];

               var rowCopy = rows[s].cloneNode(true); 

               tbody.deleteRow(s);

               if (s + 1 < rows.length)

                  tbody.insertBefore(rowCopy , rows[s + 1]);

               else

                  tbody.appendChild(rowCopy);

            }

         decres = 0;

         }

  }

}

 

function alterarNumeros(val,ch)

{

   if (ch == 0)

      {

      return val.replace(/,/, '.')

      }

   else

      {

      return val.replace(/\./, ',')

      }

}

 

function alterarDatas(val)

{

 dt = val.split(/\D+/);

 dt = -((-dt[2]*20 - dt[1])*50 - dt[0]);

 return dt;

}

// Fim das funções de ordenação dos grids

 

//Funções de uso geral

 

//Função para geração de código automático

function definirCodigo(objeto)

{

 if (objeto.value == '')

      {

       objeto.value = 'Automatico';

      __doPostBack(objeto.id,'');

       objeto.disabled = true;

      }

}

 

//Função para colocar o foco inicial da página

function focoInicial(objeto) {

      objeto.focus();

}

 

//Função para alterar a cor de fundo de um objeto

function alterarFundo(objeto, cor)

{

 objeto.style.backgroundColor = cor;

}

 

//Função para criar o efeito de link nas linhas de tabela

function criarLink(objeto, cor)

{

alterarFundo(objeto,cor);

objeto.style.cursor = 'hand';

}

 

function direcionarPaginaCadastro(pagina, id) {

      var paginaCad;

      

      paginaCad = pagina + '?ID=' + id;

      

      location.href=paginaCad;

}

 

function ValidarCheck(pContainer, pIdCheck, pMaxCheck, pMsgNaoSelec, pMsgEstouroMax, pMsgConfirmacao) {

      var objCont = document.all[pContainer];

      var intCont = 0;

 

      //Verifica a quantidade de checks marcados

      for (var i=0; i < objCont.all.length; i++) {

            if ((objCont.all[i].type == 'checkbox') && (objCont.all[i].id.indexOf(pIdCheck) >= 0)) {

                  if (objCont.all[i].checked) intCont++;

            }

      }

      

      //Mensagem por não ter checks selecionados

      if (intCont == 0) {

            alert(pMsgNaoSelec);

            return false;

      } else {

            //Mensagem por ter estourado o número máximo de checks selecionados

            if (pMaxCheck > 0 && intCont > pMaxCheck) {

                  alert(pMsgEstouroMax);

                  return false;

            }

      }

 

      //Mensagem para confirmação da operação com os checks selecionados

    if (pMsgConfirmacao.length > 0) {

            conf = confirm(pMsgConfirmacao);

            return (conf);

      }

      

      return true;

}

 

function CheckAll(pContainer, pIdCheck, pChecked) {

      var objCont = document.all[pContainer];

      var intCont = 0;

 

      //Verifica a quantidade de checks marcados

      for (var i=0; i < objCont.all.length; i++) {

            if ((objCont.all[i].type == 'checkbox') && (objCont.all[i].id.indexOf(pIdCheck) >= 0)) {

                  objCont.all[i].checked = pChecked;

            }

      }

}

 

 

function ControlarVisibilidadeDiv(strPosSeta, NomeImg, NomePainel, strPathImages) {

      if (strPosSeta == 'baixo') {

            document.all(NomePainel).style.display = 'block';

            document.all(NomeImg).src = strPathImages + 'fundo_abasetacima.gif';

            document.all(NomeImg).Seta = 'cima';

      } else {

            document.all(NomePainel).style.display = 'none';

            document.all(NomeImg).src = strPathImages + 'fundo_abasetabaixo.gif';

            document.all(NomeImg).Seta = 'baixo';

      }

}

 

function LTrim(str) {

      for (var i=0; ((i<str.length) && (str.charAt(i)<=" ")); i++);

      return str.substring(i,str.length);

}

 

function RTrim(str) {

      for (var i=str.length-1; ((i>=0) && (str.charAt(i)<=" ")); i--);

      return str.substring(0,i+1);

}

 

function Trim(str) {

      return LTrim(RTrim(str));

}      

 

 

 

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*/

 

 

// Variáveis globais

 

// Verifica se o browser é Internet Explorer

var ie4 = (document.all);

// Verifica se o browser é Netscape

var ns4 = (document.layers);

// Verifica se o browser suporta DHTML

var isDHTML = ie4 || ns4;

 

function doSelectChange(el,dest) {

      if (el.selectedIndex > -1)

      dest.value = el.options[el.selectedIndex].text;

}

 

function lookupItem(el,dest) {

      if (!isDHTML) {

            el.blur(); el.focus();

      }

      var curValue = el.value.toLowerCase();

      var found = false;

      var index = dest.selectedIndex;

      var numOptions = dest.options.length;

      var pos = 0;

      while ((!found) && (pos < numOptions)) {

      found = (dest.options[pos].text.toLowerCase().indexOf(curValue)==0) 

      if (found) 

            index = pos

      pos++;

      }

      if (found)

      dest.selectedIndex = index;

      if (!isDHTML) 

      el._v = setTimeout("lookupItem(document.lForm.textInput, document.lForm.selectInput)",500);

}

 

function maxLenght(f, length)

{

      if (f.value.length>=length) f.value = f.value.substr(0, length);

}

 

function fpu_RemoveLista(pLista)

{

    var c = new Object();

    var tamanho = pLista.length;

 

    for (i=pLista.length-1; i >= 0 ; i--) 

    {        

        if (pLista.options[i].selected) 

        {

            pLista.options[i]=null 

        } 

        return false ;

    }

}

 

function Recupera_Dados_ListBox(sel,campo)

{

var indices = ""

for (i=0; i < sel.length; i++)

      {

      indices = indices + sel.options[i].value + ";"

      }

      campo.value = indices

}

 

function Recupera_Texto_ListBox(sel,campo)

{

var indices = ""

for (i=0; i < sel.length; i++)

      {

      indices = indices + sel.options[i].innerText + ";"

      }

      campo.value = indices

}

 

function testaItensSelecionado(sel)

{

var itens_selecionados = 0

 

for (i=sel.length-1; i >= 0 ; i--) {

          if (sel.options[i].selected) {

          itens_selecionados++

          }

      }

return itens_selecionados

}

 

 

function fpu_testatecla()

{

      var l_class    = window.event.srcElement.Tipo;

      var l_tag      = window.event.srcElement.tagName;

    var l_Maxlenght= window.event.srcElement.maxLength;

      var l_obj      = window.event.srcElement;

      var l_ret      = true;

      var l_string ;

      var l_posVirgula ;

 

      var l_dec = l_class.substring(l_class.indexOf("NUMBER")+6, l_class.indexOf("NUMBER")+7);

    //alert(l_dec);

      var charCode = (navigator.appName == "Netscape") ? event.which : event.keyCode;

      if (charCode == 13){return false;}

      var var_caracter = String.fromCharCode(charCode);

      

      if (l_class == 'DATE')

      {

            if ((var_caracter=="/") || ((var_caracter>="0") && (var_caracter<="9")))

            {

                  return true;

            }

            else

            {

                  return false;

            }                 

      }

      else if (l_class == 'MES')

      {

            if ((var_caracter>="0") && (var_caracter<="9"))

            {

                  return true;

            }

            else

            {

                  return false;

            }                 

      }

      else if (l_class == 'ANO')

      {

            if ((var_caracter>="0") && (var_caracter<="9"))

            {

                  return true;

            }

            else

            {

                  return false;

            }                 

      }

      else if (l_class.indexOf("NUMBER") != -1)

      {

            if (l_dec == 0 && var_caracter==",")

        {

                  return false;

        }

        //alert('passo 1');

        

        if (l_dec != 0 && l_obj.value.length == (eval(l_Maxlenght) - (eval(l_dec) + 1)) && l_obj.value.indexOf(",") == -1 && ((var_caracter>="0") && (var_caracter<="9")))

        {

            //alert('passo 2');

            return false;

        }

 

            if ((var_caracter==",") || ((var_caracter>="0") && (var_caracter<="9")))

            {

 

                  if (l_obj.value.indexOf(",") != -1 && (var_caracter==","))

                  {

                //alert('passo 3');

                        return false;

                  }

                  else

                  {

                        l_posVirgula = l_obj.value.indexOf(",") ;

                        if (l_obj.value.indexOf(",") != -1)

                        {

                             //Leandro 15/08

                    //if (l_obj.value.substr(l_posVirgula,3).length > 2)

                    //alert(l_dec);

                    if (l_obj.value.substr(l_posVirgula,parseInt(l_dec + 1)).length > parseInt(l_dec))

                             {

                        //alert('passo 4');

                                   return false;

                             }

                             else

                             {

                                   return true;

                             }                       

                        }

                  }

            }

            else

            {

            //alert('passo 5');

                  return false;

            }     

      }     

}

 

 

 

function TestaField(obj)

{

var dt, dia, mes, ano, hh, mm, l_dia, l_mes, l_hh, l_mm, l_class, l_tag, l_obj, l_ret, l_ponto;

    

l_class = obj.Tipo;  //window.event.srcElement.Tipo;

l_tag   = obj.tagName;  //window.event.srcElement.tagName;

l_obj   = obj;   //window.event.srcElement;

l_ret   = true;

 

if (l_class == null) return;

if (l_class == 'undefined') return;

if (l_class == '') return;

 

if (l_tag.toLowerCase() == "input")

{

    if (l_obj.value != "")

    {

        if (l_class.indexOf("NUMBER") != -1)

        {

                  //Recupera a quantidade de casas decimais

            l_dec = l_class.substring(l_class.indexOf("NUMBER")+6, l_class.indexOf("NUMBER")+7);

 

            if ((l_dec != "0") && (l_dec != "")) 

            {

                        l_decimal = parseInt(l_dec); 

                  }

                  else 

                  {

                        l_decimal = 0; 

                  }

            

            //Encontra a posição da vírgula

            l_posvirgula = l_obj.value.indexOf(",");

            

            l_value = l_obj.value;

            

            if ((l_decimal == 0) && (l_posvirgula >= 0))

            {

                        //Se o número não permitir casas decimais, recupera apenas os caractes anteriores a vírgula

                        l_value = l_obj.value.substr(0, l_posvirgula);

                  }

                  

            if (l_decimal > 0) l_value = UnFormatNumber(l_obj.value, l_decimal);

                              

            if (! isNaN(replaceChar(l_value, ",", "."))) 

            {

                        if (l_decimal > 0) 

                        {

                             l_obj.value = FormatNumber(l_value, l_decimal); 

                        }

                  else 

                  {

                            l_obj.value = l_value; 

                        }

            }

            else 

            {

                        alert('Numero Invalido');

                        l_obj.value = "";

                        l_obj.focus();

                        l_ret = false;

            }

        }

        

        else if (l_class == "DATE")

        {

                  l_ret = Testa_Data(l_obj);

        }

        

        else if (l_class == "TIME")

        {

                  l_ret = Testa_Hora(l_obj);

        }

        else if (l_class == "UCHAR")

        {

            l_obj.value = replaceChar(l_obj.value,"'"," ");

            l_obj.value = replaceChar(l_obj.value,'"',' ');

            l_obj.value = l_obj.value.toUpperCase();

        }

        else if (l_class == "LCHAR")

        {

            l_obj.value = replaceChar(l_obj.value,"'"," ");

            l_obj.value = replaceChar(l_obj.value,'"',' ');

            l_obj.value = l_obj.value.toLowerCase();

        }

        else  if (l_class == "CHAR")

        {

            l_obj.value = replaceChar(l_obj.value,"'"," ");

            l_obj.value = replaceChar(l_obj.value,'"',' ');

        }

    }

}

else

{

    if (l_tag.toLowerCase() == "textarea")

    {

        l_obj.value = replaceChar(l_obj.value,"'"," ");

        l_obj.value = replaceChar(l_obj.value,'"',' ');

    }

 

    l_obj.style.background       = "white";

    l_obj.style.color            = "black";

    l_ret = true;

}

 

return (l_ret);

}

 

function Testa_DiaMes(p_dia, p_mes, p_ano)

{

var dia, mes, ano, maxday, v_mes;

 

maxday = new Array(13);

maxday[1] = 31;

maxday[2] = 29;

maxday[3] = 31;

maxday[4] = 30;

maxday[5] = 31;

maxday[6] = 30;

maxday[7] = 31;

maxday[8] = 31;

maxday[9] = 30;

maxday[10] = 31;

maxday[11] = 30;

maxday[12] = 31;

 

dia = p_dia;

mes = p_mes;

ano = p_ano;

            

if (p_mes.length == 2)

{

      if (p_mes.substr(0,1) == "0")

            v_mes = mes.substr(1,1);

      else  

            v_mes = mes.substr(0,2);

}           

else

{

      v_mes = mes.substr(1,1);     

}     

 

if ( isNaN(ano) )

{

    alert("Ano Invalido");

    return false;

}

else if(eval(ano) == 0 || eval(ano) < 1900)

{

    alert("Ano Invalido (" + ano + ")" );

    return false;

}

else if ( (mes < 1) || (mes > 12) )

{

    alert ("Mes Invalido ("+p_mes+")");

    return false;

}

else if ( (dia == 29) && (mes == 2) && ((ano % 4) != 0) )

{

    alert ("Ano nao e bissexto. Dia Invalido.");

    return false;

}

else if ( (dia < 1) || (dia > maxday[v_mes]) )

{

    alert ("Dia Invalido");

    return false;

}

else {

    return true; }

}

 

function Testa_Data(p_CpoData)

{  

var valor, dia, mes, ano;

 

valor = "" + UnFormatDate(p_CpoData.value);

 

if (valor.length == 6)

{

    dia = valor.substring(0,2);

    mes = valor.substring(2,4);

    if (parseFloat(valor.substring(4,6)) >= 70)

        ano = "19"+valor.substring(4,6);

    else

        ano = "20"+valor.substring(4,6);

 

    if (! Testa_DiaMes(dia,mes,ano)) 

    {

        p_CpoData.focus();

        return(false); 

    }

    else

    {

        p_CpoData.value = dia+"/"+

                        mes+"/"+

                        ano;

        return(true);

    }

}

else if (valor.length == 8)

{

    dia = valor.substring(0,2);

    mes = valor.substring(2,4);

    ano = valor.substring(4,8);

 

    if (! Testa_DiaMes(dia,mes,ano)) 

    {

        p_CpoData.focus();

        return(false); 

    }

    else

    {

        p_CpoData.value = dia+"/"+

                        mes+"/"+

                        ano;

        return(true);

    }

}

else

{

    if (valor.length > 0)

    {

        alert("Data Invalida");

        p_CpoData.focus();

        return(false);

    }

    else {

        return (true); }

}

}

        

 

function Testa_Hora(p_CpoHora)

{  

      var valor, hora, minuto;

 

      valor = "" + UnFormatDate(p_CpoHora.value);

 

      if (valor.length == 2)

      {     

            hora = valor;

            minuto = "00";

      }

      else if (valor.length == 4)

      {

            hora = valor.substring(0,2);

            minuto = valor.substring(2,4);

      }

      else

      {

        alert("Hora Invalida");

        p_CpoHora.focus();

        return(false);

      }

      if    (

            (parseFloat(hora) >= 0 && parseFloat(hora) <= 23) &&

            (parseFloat(minuto) >= 0 && parseFloat(minuto) <= 59)

            ) 

      {

            p_CpoHora.value = hora + ":" + minuto;

            return(true);

      }

      else

      {

        alert("Hora Invalida");

            p_CpoHora.focus();

        return(false); 

      }

}

 

 

function replaceChar(s, c_org, c_dst)

{

ret = "";

for (i=0; i<s.length; i++)

{

    if (s.substring(i,i+1) == c_org)

        ret += c_dst;

    else

        ret += s.substring(i,i+1);

}

 

return(ret);

}

 

    

function inField()

{

      //l_class = window.event.srcElement.className;

      l_class = window.event.srcElement.Tipo;

      l_tag   = window.event.srcElement.tagName;

      l_obj   = window.event.srcElement;

      l_ret   = true;

      

      if (l_class == null) return;

      if (l_class == 'undefined') return;

      if (l_class == '') return;

 

      if ((l_tag.toLowerCase() == "input"))

      {

            if (l_class.indexOf("NUMBER") != -1)

            {

                  l_dec = l_class.substring(l_class.indexOf("NUMBER")+6, l_class.indexOf("NUMBER")+7);

 

                  if ((l_dec != "0")  && (l_dec != "")) {

                        l_decimal = parseInt(l_dec); }

                  else {

                        l_decimal = 0; }

                  

                  l_obj.value = UnFormatNumber(l_obj.value, l_decimal);

                  l_obj.select();

            }

            else if (l_class == "DATE")

            {

                  l_obj.value = UnFormatDate(l_obj.value);

                  l_obj.select();

            }

         

      }

}

 

 

function outField(s, d)

{

s.value = FormatNumber(s.value, d);

}

    

function FormatNumber(n, d)

{

 

s = UnFormatNumber(n, d);

pt = s.indexOf(",");

 

s = replaceChar(s, ".", ",");

ini = pt - 1;

while ( (Math.floor((ini+1) / 3) > 0) && (ini > 2) )

{

    s = s.substring(0, ini-2) + "." + s.substring(ini-2, s.length);

    ini = ini - 3;

}

 

return(s);

}

    

    

function UnFormatNumber(n, d)

{

 

      //Retira os pontos

      n = replaceChar(n, ".", "");

      

      //Encontra a posição da vírgula

      l_posvirgula = n.indexOf(',');

 

      //Verifica a quantidade de casas decimais após a vírgula

      if (l_posvirgula >= 0) {

            l_qtdcasas = n.length - l_posvirgula - 1;

            

            if (l_qtdcasas > d)     {

                  n = n.substr(0, n.length - (l_qtdcasas - d));

            }

      }

 

      return (n);

}

 

 

function UnFormatDate(n)

{

 

s = "";

 

//Separa apenas os caracteres numéricos

for (i=0; i < n.length; i++)

{

      c = n.substring(i, i+1);

      if ( (c >= "0") && (c <= "9") )

            s+=c;

}

 

return(s);

}

 

 

function Run(s)

{

parent.dados.document.info.action = s+".asp";

parent.dados.document.info.submit();

}

 

function getCheckedValue(CampoRadio, QtdOption)

{

for (i=0; i < QtdOption; i++)

    if (CampoRadio[i].checked)

        return (CampoRadio[i].value);

return ("");

}

 

function Verifica_Data(dma)

{

 if(dma.value != '')

 {

      if (dma.value.length == 10)

      {

       if (dma.value.substr(2,1) != "/")

       {

        alert("A data deve ser inserida no formato dd/mm/aaaa");

        dma.value = "";

        dma.focus();

        return;

       }

       else if (dma.value.substr(5,1) != "/")

       {

        alert("A data deve ser inserida no formato dd/mm/aaaa");

        dma.value = "";

        dma.focus();

        return;

       }

       else

       {

        d=dma.value.substr(0,2);

        m=dma.value.substr(3,2);

        a=dma.value.substr(6,4);

       }

      }

      else if (dma.value.length == 8)

      {

       d=dma.value.substr(0,2);

       m=dma.value.substr(2,2);

       a=dma.value.substr(4,4);

      } 

      else if (dma.value.length != '' && dma.value.length != 10 && dma.value.length != 8)

      { 

       alert("Entre com uma data válida.")

       dma.value = "";

       dma.focus();

       return;

      }

 

      if  (((isNull(d)) || (isNull(m)) || (isNull(a))) && ((!isNull(d)) && (!isNull(m)) && (!isNull(a)))) 

      { 

       alert("Entre com uma data válida.")

       dma.value = "";

       dma.focus();

       return false;

      }

      if ( (isNaN(d) && d != '') || (isNaN(m) && m != '') || (isNaN(a) && a != '') ) 

      { 

       alert("Entre com uma data válida.")

       dma.value = "";

       dma.focus();

       return false;

      }

      if ( (m<1 || m >12) && (m != '') )

      { 

       alert("Entre com uma data válida.")

       dma.value = "";

       return false;

      }

      if ( (d<1 || d >31) && (d != '') )

      { 

       alert("Entre com uma data válida.")

       dma.value = "";

       dma.focus();

       return false;

      }

      if ( (a<1900 || a>2078) && (a !='') )

      { 

       alert("Entre com uma data válida.")

       dma.value = "";

       dma.focus();

       return false;

      }

      if (d == 31)

      {

       if( (m == 2) || (m == 4) || (m == 6) || (m == 9) || (m == 11)) 

       { 

       alert("Entre com uma data válida.")

       dma.value = "";

       dma.focus();

       return false;

       }

       return true;

      }

      if (m ==2)

      {

       if( (parseInt(a)%4 != 0 && d ==29) || (d == 30) )

       { 

       alert("Entre com uma data valida.")

       dma.value = "";

       dma.focus();

       return false;

       }

       return true;

      }

 }

}

function isNull(str) 

{ 

 if (str==null) return true

 

 for (var intLoop = 0; intLoop < str.length; intLoop++)

  if (" " != str.charAt(intLoop))

   return false;            

 return true; 

}

 

 

function Testa_Maximo(pTextArea,pTamanho)

{

 if(pTextArea.value.length > pTamanho )

 {

  pTextArea.value = pTextArea.value.substring(1,pTamanho);

  return false;

 }

}

 

 

function fpu_DropDownValueToText(pDropDown,pText)

{

 if(pDropDown.selectedIndex != 0)

 {

  pText.value = pDropDown.value ;

 } 

}

 

function fpu_DisableFields(pFrm)

{

  e = pFrm.elements;

  if (pFrm.txt_numsolicitacao.value.length > 0) 

  {

   for (i=0;i<e.length;i++)

     if (e[i].name != 'txt_numsolicitacao') 

     {

            e[i].disabled=true;

       }

  }

  else 

  {

   for (i=0;i<e.length;i++)

     e[i].disabled=false;

  }

}

 

function fpu_TestNumberKeyPress(pControl)

{

 if(isNaN(pControl.value))

 {

  

 }

}

 

function fpu_MostraAmpulheta(pBtn)

{           

      pBtn.style.cursor = 'wait';

      return true ;

}

 

 

//////Teste

<!--

// ------------------------------------------------------------------------------------------ //

// Acrescenta algumas propriedades aos controles:

// .Indice        : indica o índice na tela para o controle

// .IndiceAnterior   : indica o índice do controle anterior

// .IndicePosterior  : indica o índice para o controle posterior

// .Tam           : tamanho máximo para digitação

// .AutoSkip      : indica se pula para o próximo campo após completar o tamanho do campo

// .Tipo       : indica o tipo de dado

//                'D' -> só dígitos de 0(zero) a 9(nove)

//                'N' -> dígitos de 0(zero) a 9(nove), "."(ponto) e ","(vírgula)

//                'C' -> caracteres de 'a' até 'z' e de 'A' até 'Z'

//                'P' -> caracteres de 'a' até 'z', de 'A' até 'Z' e de 0(zero) a 9(nove)         

//                'H' -> dígitos de 0(zero) a 9(nove), "/" (Separador de data)

//                'X' -> caracteres de 'a' até 'z', de 'A' até 'Z' e de 0(zero) a 9(nove), "/"         

//                outro -> qualquer caracter entre ascii 32 e ascii 127

// .Saltar        : (reservado) indica o momento de saltar de campo

// ------------------------------------------------------------------------------------------ //

 

// Carrega índices para o próximo controle e controle anterior

function InicializarIndices()

{

   if (document.CargaInicial==null)

   {

      document.CargaInicial=false;     // Seta para só fazer uma vez por documento

      var ctrlAnterior=null;

      var IndAnt=0;

      for ( var i=0; i<document.forms[0].elements.length;i++)

      {

         var e=document.forms[0].elements[i];

         if ( e.type!="hidden" && e.type!="image" )      

         {

            if ( ctrlAnterior != null )

               ctrlAnterior.IndicePosterior=i;

            ctrlAnterior=e;

            e.Indice=i;

            e.IndiceAnterior=IndAnt;

         }

      }

   }

}

 

// Colocar o foco em determinado campo

function SetarFoco ( ind )

   {

   InicializarIndices();

   if ( isNaN(ind) && document.forms[0].elements[ind].type!="hidden" )

      document.forms[0].elements[ind].focus();

   else

      for (;ind<document.forms[0].elements.length;ind++)

         if ( document.forms[0].elements[ind].type!="hidden" )

            break;

      if ( ind<=document.forms[0].elements.length )

         document.forms[0].elements[ind].focus();

   }

 

// Limpar o conteúdo do(s) campo(s)

function LimparCampo ( ind )

   // Para -1, limpa todos os elementos

   {

   if (isNaN(ind))         // Limpa pelo nome

      document.forms[0].elements[ind].value="";

   else if (ind != -1 ) // Limpa o elemento "ind" ( só considera "text" e "password" )

      for ( var i=ind; i < document.forms[0].elements.length;i++ )

         if ( document.forms[0].elements[i].type=="text" || document.forms[0].elements[i].type=="password")    // Só limpa campo "text"

            {

            document.forms[0].elements[i].value="";

            break;

            }

   else              // Limpa todos os elementos "text" e "password"

      for ( var i=0; i < document.forms[0].elements.length; i++ )

         if ( document.forms[0].elements[i].type=="text" || document.forms[0].elements[i].type=="password" )

            document.forms[0].elements[i].value="";

      

   }

 

// Verificar qual navegador

   function QualNavegador() 

   {

      var s = navigator.appName;

      if ( s.indexOf("Microsoft") >= 0 )

         return "IE";

      else 

      if ( s.indexOf("Netscape") >= 0 )

         return "NE";

      else

         return "";

   }

 

// Verificar qual a versão do navegador

function QualVersao()

{

   var s = navigator.appVersion;

   if ( QualNavegador() == "IE" )

   {

      var i = s.search("MSIE");

      s=s.substring(i+5);

      i=s.search(".");

      return parseInt(s.substring(0,i+1), 10);

   }

   else if ( QualNavegador() == "NE" )

      return parseInt(s.substring(0,1), 10);

   else

      return 0;

}

 

 

// Setar o evento

function SetarEvento(ctrl, Tam, Tipo, AutoSkip )

{

   // Filtra navegadores conhecidos

   var s = QualNavegador();

   if ( s.length==0 )

      return;

 

   if (ctrl.onkeypress==null)

   {

      if (AutoSkip==null)

         AutoSkip = true;

      else

         AutoSkip = false;

 

      if (Tipo!=null)

         Tipo.toUpperCase();

         

      ctrl.Tam=Tam;

      ctrl.Tipo=Tipo;

      ctrl.AutoSkip=AutoSkip;

      ctrl.Saltar=false;

      

      InicializarIndices();

      ctrl.onkeypress=ValidarTecla;

      

      if (QualNavegador()=="IE" && QualVersao()>=5)

         ctrl.onkeyup=SaltarCampo;

   }

}

 

function SaltarCampo(ctrl)

{

   

   if (ctrl==null)

      ctrl=this;

   if ( ctrl.AutoSkip && ctrl.Saltar)

      if (ctrl.Saltar)

      {

         ctrl.Saltar=false;

         if ( ctrl.IndicePosterior != null )

            SetarFoco(ctrl.IndicePosterior);

      }

}

 

// Fazer o salto de campo

function ValidarTecla (evnt)

{

   var tk;

   var c;

   var Tam;

 

   tk = ( (QualNavegador()=="IE") ? event.keyCode : evnt.which);

   c=String.fromCharCode(tk);

   c=c.toUpperCase();

   

   switch ( this.Tipo.substring(0,1) )

   {

      case "D":

         if ( (c<"0" || c>"9") && (tk != "8") )

            return false;

         break;

      case "N":

         if ( (c<"0" || c>"9") && (c!="," && tk != "8") )

            return false;

         if ( (c==",") && ((this.value.search(",")>-1) || (this.value.length==0)) )

            return false;

         break;

      case "H":

            if ( (c<"0" || c>"9") && (c!="/" && tk != "8") )

               return false;

         break;

      case "C":

         if ( (c<"A" || c>"Z") && (tk != "8") )

            return false;

         break;

      case "P":

         if ( ( c<"A" || c>"Z" ) && ( c<"0" || c>"9" ) && (tk != "8") )

            return false;

         break;

      case "X":

         if ( ( c<"A" || c>"Z" ) && ( c<"0" || c>"9" ) && (c!="/" && tk != "8") )

            return false;

         break;

      default:

         if ( c=="@" ) return false;

         break;

   }

 

   Tam = this.Tam-1;

   if ((QualNavegador()=="NE") && (QualVersao()==5))

      Tam = this.Tam;

 

   this.Saltar=(this.value.length==Tam);

 

   if ( ((QualNavegador()=="IE") && QualVersao()<5) || (QualNavegador()!="IE") )

      SaltarCampo(this);

 

   return true;

}

 

function fpu_ValidarTecla()

{

   var tk;

   var c;

   var Tam;

   

   tk = ( (QualNavegador()=="IE") ? event.keyCode : evnt.which);

   c=String.fromCharCode(tk);

   c=c.toUpperCase();

 

   l_class = window.event.srcElement.Tipo;

   l_campo = window.event.srcElement;

 

   

   switch ( l_class )

   {

      case "NUMBER":

         if ( (c<"0" || c>"9") && (tk != "8") )

            return false;

         break;

      case "NUMBER2":

         if ( (c<"0" || c>"9") && (c!="," && tk != "8") )

            return false;

         if ( (c==",") && ((this.value.search(",")>-1) || (this.value.length==0)) )

            return false;         

         if (this.value.length==this.maxlenght - 2)

         {            

            return false;

         }

 

 

         break;

      case "DATE":

            if ( (c<"0" || c>"9") && (c!="/" && tk != "8") )

               return false;

         break;

 

      default:

         if ( c=="@" ) return false;

         break;

 

      }

}

 

 

// Preenche com zeros a esquerda

function FillLeft(St, Caract, Tamanho)

{

   var monta = St;

   if ( St.length < Tamanho )

   {

     monta = "";

     for ( var i = 1; i <= (Tamanho - St.length); i++ )

     {

        monta = monta + Caract;

     }

     monta = monta + St;

   }

   return monta ;

}

 

 

function FormataCNPJ(Campo, teclapres){

 

      var tecla = teclapres.keyCode;    

 

      var vr = new String(Campo.value);

      vr = vr.replace(".", "");

      vr = vr.replace(".", "");

      vr = vr.replace("/", "");

      vr = vr.replace("-", "");

 

      tam = vr.length + 1 ;

 

    var var_caracter = String.fromCharCode(tecla);

    if (isNaN(var_caracter))

    {

        return false;

    } 

 

 

      if (tecla != 9 && tecla != 8){

            if (tam > 2 && tam < 6)

                  Campo.value = vr.substr(0, 2) + '.' + vr.substr(2, tam);

            if (tam >= 6 && tam < 9)

                  Campo.value = vr.substr(0,2) + '.' + vr.substr(2,3) + '.' + vr.substr(5,tam-5);

            if (tam >= 9 && tam < 13)

                  Campo.value = vr.substr(0,2) + '.' + vr.substr(2,3) + '.' + vr.substr(5,3) + '/' + vr.substr(8,tam-8);

            if (tam >= 13 && tam < 15)

                  Campo.value = vr.substr(0,2) + '.' + vr.substr(2,3) + '.' + vr.substr(5,3) + '/' + vr.substr(8,4)+ '-' + vr.substr(12,tam-12);

            }

}

 

function FormataCEP(Campo, teclapres)

{

    var tecla = teclapres.keyCode;

    

    var vr = (Campo != null) ? (new String(Campo.value)) : ("");

    

    vr = vr.replace("-", "");

      

      tam = vr.length + 1 ;

 

    var var_caracter = String.fromCharCode(tecla);

    

    //alert(var_caracter + " " + tam.toString() + " " + vr);           

      

    if (isNaN(var_caracter))

    {

        return false;

    }

      

      if (tecla != 9 && tecla != 8)

      {

            if (tam > 5 && tam < 8)

            {

                  Campo.value = vr.substr(0, 5) + '-' + vr.substr(5, tam);

            }

      }

}

 

 

function Verifica_CGC(veio) 

{ 

        with (Math) 

        { 

                w = 0; 

                Resp1 = ""; 

                Resp2 = ""; 

                CGC = replaceChar(veio,".",""); 

                CGC = replaceChar(CGC,"/",""); 

                CGC = replaceChar(CGC,"-",""); 

                

                VtCGC = new CriaArray(CGC.length); 

                for (var i=0;i < CGC.length;i++) 

                { 

                        if ((CGC.charAt(i) == "0") || (CGC.charAt(i) == "1") || (CGC.charAt(i) == "2") || (CGC.charAt(i) == "3") || (CGC.charAt(i) == "4") || (CGC.charAt(i) == "5") || (CGC.charAt(i) == "6") || (CGC.charAt(i) == "7") || (CGC.charAt(i) == "8") || (CGC.charAt(i) == "9")) 

                        { 

                                VtCGC[w]=parseFloat(CGC.charAt(i)); 

                                w++; 

                }       } 

                        

                Soma1 = (VtCGC[0]*5)+(VtCGC[1]*4)+(VtCGC[2]*3)+(VtCGC[3]*2)+(VtCGC[4]*9)+(VtCGC[5]*8)+(VtCGC[6]*7)+(VtCGC[7]*6)+(VtCGC[8]*5)+(VtCGC[9]*4)+(VtCGC[10]*3)+(VtCGC[11]*2)+0.0001;

                Divisao1 = Soma1 / 11; 

                RestoParc1 = (Divisao1 - floor(Divisao1))*11; 

                Resto1 = floor(RestoParc1); 

  

                Soma2 = (VtCGC[0]*6)+(VtCGC[1]*5)+(VtCGC[2]*4)+(VtCGC[3]*3)+(VtCGC[4]*2)+(VtCGC[5]*9)+(VtCGC[6]*8)+(VtCGC[7]*7)+(VtCGC[8]*6)+(VtCGC[9]*5)+(VtCGC[10]*4)+(VtCGC[11]*3)+(VtCGC[12]*2)+0.0001;

                Divisao2 = Soma2 / 11; 

                RestoParc2 = (Divisao2 - floor(Divisao2))*11; 

                Resto2 = floor(RestoParc2); 

                if (((Resto1 == 0) || (Resto1 == 1)) && (VtCGC[12] == 0)) 

                { 

                        Resp1 = "V"; 

                } 

                else 

                { 

                        Digito1 = 11 - Resto1; 

                        if ((Digito1 == VtCGC[12]) && (Resto1 > 1)) 

                        { 

                                Resp1 = "V"; 

                }       } 

 

                if (((Resto2 == 0) || (Resto2 == 1)) && (VtCGC[13] == 0)) 

                { 

                        Resp2 = "V"; 

                } 

                else 

                { 

                        Digito2 = 11 - Resto2; 

                        if ((Digito2 == VtCGC[13]) && (Resto2 > 1)) 

                        { 

                                Resp2 = "V"; 

                }       } 

  

                if ((Resp1 == "V") && (Resp2 == "V")) 

                {       

                        return true; 

                } 

                else 

                { 

                        alert("CNPJ Invalido");  

                        return false; 

                        }       

            }       

} 

 

function CriaArray(n) 

{

      this.length=n

      for (var i=1;i<=n;i++)

      {this[i]=""}

}

 

 

// Função para fazer pesquisas em Combos e Listas

// Zera Integradora

 

var ie4 = (document.all);

var ns4 = (document.layers);

var isDHTML = ie4 || ns4;

 

function doSelectChange(el,dest) {

      if (el.selectedIndex > -1)

      dest.value = el.options[el.selectedIndex].text;

}

 

function lookupItem(el,dest) {

      if (!isDHTML) {

            el.blur(); el.focus();

      }

      var curValue = el.value.toLowerCase();

      var found = false;

      var index = dest.selectedIndex;

      var numOptions = dest.options.length;

      var pos = 0;

      while ((!found) && (pos < numOptions)) {

      found = (dest.options[pos].text.toLowerCase().indexOf(curValue)==0) 

      if (found) 

            index = pos

      pos++;

      }

      if (found)

      dest.selectedIndex = index;

      if (!isDHTML) 

      el._v = setTimeout("lookupItem(document.lForm.textInput, document.lForm.selectInput)",500);

}

 

 

//Função que conta o limite de caracteres

function textContador(txtArea, strObjMsg, limite) {

      //Se o tamanho do TEXTAREA for maior que o especificado na propriedade

      //MAXLENGTH, corta o texto até o tamanho máximo

      if (txtArea.value.length > limite) {

            txtArea.value = txtArea.value.substr(0, limite);

      }

 

      //Se for especificado algum campo de contagem

      if (strObjMsg != '') {

            var remtxtarea = document.getElementById(strObjMsg);

            remtxtarea.innerText = "caracteres: " + txtArea.value.length + " de " + limite;

      }

}
