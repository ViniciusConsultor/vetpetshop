function alerta()
{
decisao = confirm("Deseja realmente excluir este registro?");
if (decisao) {
    return true;
}
else {
    return false;
}
}