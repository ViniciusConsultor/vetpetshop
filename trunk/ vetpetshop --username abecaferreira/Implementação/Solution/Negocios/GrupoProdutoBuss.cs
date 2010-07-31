using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;
using System.Data;

namespace Negocios
{
    public class GrupoProdutoBuss
    {
        private GrupoProdutoDAO grupoDAO;

        public GrupoProdutoBuss()
        {
            this.grupoDAO = new GrupoProdutoDAO();
        }

        public bool InserirGrupo(Grupo grupo)
        {
            bool salvou;
            salvou = this.grupoDAO.InserirGrupo(grupo);
            return salvou;
        }

        public DataTable ListarGrupos(DataTable tabela)
        {
            DataTable _tabelaPreenchida = new DataTable();
            _tabelaPreenchida = this.grupoDAO.ListarGrupos(tabela);
            return _tabelaPreenchida;
        }

        public bool ExcluirGrupo(int id)
        {
            bool executou;
            executou = this.grupoDAO.ExcluirGrupo(id);
            return executou;
        }

        public List<Grupo> ListarTiposGrupo()
        {
            List<Grupo> _lista = new List<Grupo>();
            _lista = this.grupoDAO.ListaTiposGrupos();
            return _lista;
        }

    }
}
