using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using DAO;
using System.Data;

namespace Negocios
{
    public class AnimalBuss
    {
        private AnimalDAO animalDAO;

        public AnimalBuss()
        {
            this.animalDAO = new AnimalDAO();
        }

        public bool InserirAnimal(Animal animal)
        {
            bool executou = this.animalDAO.InserirAnimal(animal);
            return executou;
        }


        public bool AlterarAnimal(Animal animal)
        {
            bool executou = this.animalDAO.AlterarAnimal(animal);
            return executou;
        }

        public List<Animal> ListarAnimaisCadastrados(string Nome)
        {
            List<Animal> lstAnimal = new List<Animal>();
            lstAnimal = this.animalDAO.ListarAnimaisCadastrados(Nome);

            return lstAnimal;
        }

        public List<Animal> ListarAnimaisTodos()
        {
            List<Animal> lstAnimal = new List<Animal>();
            lstAnimal = this.animalDAO.ListarAnimaisTodos();

            return lstAnimal;
        }

        public bool AgendamentoVacinacao(Int32 idAnimal, DateTime dataproxvac)
        {
            bool executou = this.animalDAO.AgendamentoVacinacao(idAnimal,dataproxvac);
            return executou;
        }

        public bool AlterarAgendamentoConsulta(Int32 id_consulta, Int32 id_usuario, DateTime dataconsulta, decimal valor, Int32 status)
        {
            bool executou = this.animalDAO.AlterarAgendamentoConsulta(id_consulta, id_usuario, dataconsulta, valor, status);
            return executou;
        }

        public bool ExcluirAnimal(int id)
        {
            bool executou = this.animalDAO.ExcluirAnimal(id);
            return executou;
        }

        public bool ExcluirConsulta(int id)
        {
            bool executou = this.animalDAO.ExcluirConsulta(id);
            return executou;
        }

        public List<Animal> ListarDDLAnimais(int idCliente)
        {
            List<Animal> _lista = new List<Animal>();
            _lista = this.animalDAO.ListarDDLAnimais(idCliente);
            return _lista;
        }

        public DataTable ConsultarAnimal(DataTable tabela, Int32 idAnimal)
        {
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = this.animalDAO.ConsultarAnimal(tabela, idAnimal);
            return tabelaPreenchida;
        }

        public DataTable ObterConsultasAnimal(DataTable tabela, Int32 idAnimal)
        {
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = this.animalDAO.ObterConsultasAnimal(tabela, idAnimal);
            return tabelaPreenchida;
        }
        public DataTable ListarConsultasAnimais(DataTable tabela)
        {
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = this.animalDAO.ListarConsultasAnimais(tabela);
            return tabelaPreenchida;
        }

        public DataTable ListarDadosReceitaMedica(Int32 idConsulta)
        {
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = this.animalDAO.ListarDadosReceitaMedica(idConsulta);
            return tabelaPreenchida;
        }
        public DataTable ListarConsultasAnimais2(DataTable tabela, string proprietario, DateTime dataconsulta)
        {
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = this.animalDAO.ListarConsultasAnimais2(tabela, proprietario, dataconsulta);
            return tabelaPreenchida;
        }

        public DataTable ListarVacinacoesAnimais(DataTable tabela)
        {
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = this.animalDAO.ListarVacinacoesAnimais(tabela);
            return tabelaPreenchida;
        }
        public List<Animal> PreencheAnimal(Int32 CodAnimal)
        {
            List<Animal> _lista = new List<Animal>();
            _lista = this.animalDAO.PreencheAnimal(CodAnimal);
            return _lista;
        }

        public bool AgendamentoConsulta(Int32 idUsuario,Int32 idAnimal, Decimal Valor, DateTime datConsulta, Int32 status, int tipo, DateTime dataVacinacao)
        {
            bool executou = this.animalDAO.AgendamentoConsulta(idUsuario, idAnimal, Valor, datConsulta, status, tipo, dataVacinacao);
            return executou;
        }

        public DataTable ListarConsultasAPagar(DataTable tabela, string nomeAnimal)
        {
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = this.animalDAO.ListarConsultasAPagar(tabela,nomeAnimal);
            return tabelaPreenchida;
        }

        public Consulta ListarConsultaAnimalAPagar(Int32 idConsulta)
        {
            Consulta consulta = new Consulta();

            consulta = animalDAO.ListarConsultaAnimalAPagar(idConsulta);

            return consulta;
        
        }

        public bool AlteraStatusConsultaPaga(Int32 idConsulta, Int32 idFinanceiro)
        {
            bool executou = animalDAO.AlteraStatusConsultaPaga(idConsulta, idFinanceiro);
            return executou;
        }
    }
}
