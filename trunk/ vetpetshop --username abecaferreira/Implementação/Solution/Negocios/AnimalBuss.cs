using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using DAO;
using System.Data;

namespace Negocios
{
    class AnimalBuss
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

        //public bool InserirCliente(Animal animal)
        //{
        //    bool executou = this.animalDAO.InserirAnimal(animal);
        //    return executou;
        //}

        //public DataTable ListarAnimais(DataTable tabela)
        //{
        //    DataTable _tabelapreenchida = new DataTable();
        //    _tabelapreenchida = this.animalDAO.ListarAnimal(tabela);

        //    return _tabelapreenchida;
        //}

        public bool ExcluirAnimal(int id)
        {
            bool executou = this.animalDAO.ExcluirAnimal(id);
            return executou;
        }

    }
}
