using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Biblioteca
{
    /// <summary>
    /// Contem quase todas as operações de Linq a base de dados Biblioteca
    /// </summary>
    ///
    public class QueryBiblioteca
    {
        private const double DURACAO = 5;

        private static IQueryable<View_Livro> livros;

        public QueryBiblioteca()
        {
            
        }


        /// <summary>
        /// O método que retorna o nome completo do autor passando id do autor
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static string GetAutor(int id){
            using (var entidade = new BibliotecaEntity())
            {
                var autores = from a in entidade.Autores select a;


                foreach (var autor in autores)
                {

                    if (autor.ID_Autor == id)
                    {
                        return string.Format("{0} {1}", autor.Nome,autor.Apelido);

                    }
                }
            }
            return string.Empty;
        }

        public static string GetCategoria(int id)
        {
            using (var entidade = new BibliotecaEntity())
            {
                var categorias = from c in entidade.Categorias select c;

                foreach (var cat in categorias)
                {

                    if (cat.ID_Categoria == id)
                    {
                        return string.Format("{0}", cat.Nome_Categoria);

                    }
                }

            }
            return string.Empty;
        }


        public static string GetEditora(int id)
        {
            using (var entidade = new BibliotecaEntity())
            {
                var editoras = from e in entidade.Editoras select e;

                foreach (var editora in editoras)
                {
                    if (editora.ID_Editora == id)
                    {
                        if (editora.ID_Editora == id)
                        {
                            return editora.Nome;
                        }
                    }
                }
            }

            return string.Empty;
        }


        public static List<View_Livro> GetDetalhoLivro(int id)
        {
            try
            {
                using (var entidade = new BibliotecaEntity())
                {
                    var livros = from lv in entidade.View_Livro
                                 where lv.Código == id
                                 select lv;
                    return livros.ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
            
        }

       

        /// <summary>
        /// Obter todos os dados da requisição do livro
        /// </summary>
        /// <returns></returns>
        public static List<view_utilizador_req_livro> GetLivrosEmprestadosPelosUtilizadores()
        {
            using (var entidade = new BibliotecaEntity())
            {

                var livroReqUtil = from lr in entidade.view_utilizador_req_livro
                                   select lr;
                return livroReqUtil.ToList();
            }
        }
        
        /// <summary>
        /// Obter livros requisitados pelo "utilizador" logado
        /// </summary>
        /// <param name="qualUtilizador"></param>
        /// <returns>Lista</returns>
        public static List<view_utilizador_req_livro> GetLivrosEmprestadosPelosUtilizadores(string qualUtilizador)
        {
            try
            {
                using (var entidade = new BibliotecaEntity())
                {
                    var livrosRequisitados = from lr in entidade.view_utilizador_req_livro
                                             where lr.IDLogin.Equals(qualUtilizador)
                                             select lr;
                    return livrosRequisitados.ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static View_Livro GetLivro(int codigo)
        {
            try
            {
                using (var entidade = new BibliotecaEntity())
                {
                    var lv = (from l in entidade.View_Livro
                             where l.Código.Equals(codigo)
                             select l).Single();
                    return lv;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public static object GetLivro(string termo)
        {
            using (var entidade = new BibliotecaEntity())
            {
                object livros = null;
                if (string.IsNullOrEmpty(termo.Trim()))
                {
                    livros = entidade.Livros
                                     .Select(l => new { l.ID_Livro, l.Titulo })
                                     .OrderBy(x=>x.Titulo).ToList();
                }
                else
                {
                    livros = entidade.Livros.Where(lw => lw.Titulo.Contains(termo))
                                            .Select(liv => new { liv.ID_Livro, liv.Titulo })
                                            .OrderBy(x => x.Titulo).ToList();
                }
                return livros;
            }
        }

        /// <summary>
        /// Pesquisar livro pelo critério de pesquisa
        /// </summary>
        /// <param name="criterio"></param>
        /// <returns></returns>
        public static List<View_Livro> GetLivroByCriterio(string criterio)
        {
            try
            {
                using (var entidade = new BibliotecaEntity())
                {

                    if (string.IsNullOrEmpty(criterio))
                    {

                        livros = from l in entidade.View_Livro
                                 select l;
                    }
                    else
                    {
                        livros = from l in entidade.View_Livro
                                 where l.Titulo.ToLower().Contains(criterio.ToLower())
                                 select l;

                    }
                    return livros.ToList();
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        /// <summary>
        /// Operação da requisição do livro passando o parâmetro "código do livro" e "nome do utilizador logado"
        /// </summary>
        /// <param name="qualLivro"></param>
        /// <param name="username"></param>
        /// <returns></returns>
        public static bool RequisitarLivro(int qualLivro, string username)
        {
            try
            {
                using (var entidade = new BibliotecaEntity())
                {

                    UtilizadorLivro ul = new UtilizadorLivro();

                    var idDoLivro = (from l in entidade.Livros
                                     where l.ID_Livro == qualLivro
                                     select l.ID_Livro).Single<Int32>();

                    var idDoUtilizador = (from u in entidade.Utilizadores
                                          where u.NomeUtilizador == username
                                          select u.ID_Utilizador).Single<Int32>();

                    if (idDoLivro > 0 || idDoUtilizador > 0)
                    {
                        ul.ID_Utilizador = idDoUtilizador;
                        ul.ID_Livro = idDoLivro;
                        ul.dataEmprestimo = DateTime.Now;
                        ul.dateDevolucao = DateTime.Now.AddDays(DURACAO);

                        entidade.UtilizadoresLivros.Add(ul);
                        entidade.SaveChanges();
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return false;
        }

    }
}
