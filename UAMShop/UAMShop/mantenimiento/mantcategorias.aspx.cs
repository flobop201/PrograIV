﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UAMShop
{
    public partial class Mantenimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnActualizarCategoria_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            GridViewEditarCategorias.Visible = true;
            GridViewEditarCategorias.DataBind();
            GridViewVerCategorias.DataBind();
        }

      

        protected void btnagregarcategoria_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            lblCategoria.Visible = true;
            txtbCategoria.Visible = true;
            btnAgregarCat.Visible = true;
            GridViewEditarCategorias.DataBind();
            GridViewVerCategorias.DataBind();
        }

        protected void btnVerCategoria_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            GridViewVerCategorias.Visible = true;
            GridViewEditarCategorias.DataBind();
            GridViewVerCategorias.DataBind();
        }

        protected void btnAgregarCat_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters.Add("Categoria", txtbCategoria.Text);

           var x = SqlDataSource1.Insert();
           if (x == 1) 
           {
               //"Valor ingresado satisfactoriamente";
           }
            GridViewEditarCategorias.DataBind();
            GridViewVerCategorias.DataBind();
        }

        protected void GridViewEditarCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}