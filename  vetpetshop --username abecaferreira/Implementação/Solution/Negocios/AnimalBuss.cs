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

        public bool AgendamentoVacinacao(Int32 idAnimal, DateTime dataproxvac)
        {
            bool executou = this.animalDAO.AgendamentoVacinacao(idAnimal,dataproxvac);
            return executou;
        }

        public bool ExcluirAnimal(int id)
        {
            bool executou = this.animalDAO.ExcluirAnimal(id);
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

    }
}
