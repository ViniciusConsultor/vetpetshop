using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;
using System.Data;

namespace Negocios
{
    public class TipoAnimalBuss
    {
        private TipoAnimalDAO tipoanimalDAO;
          

       public TipoAnimalBuss()
        {
            this.tipoanimalDAO = new TipoAnimalDAO();
        }

       public List<TipoAnimal> ListarTiposAnimal()
       {
           List<TipoAnimal> _lista = new List<TipoAnimal>();
           _lista = this.tipoanimalDAO.ListaTiposAnimal();
           return _lista;
       }
    }
}
