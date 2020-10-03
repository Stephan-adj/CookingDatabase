using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Runtime.InteropServices;

namespace CookingApp
{
    class Program
    {
        static ConsoleKeyInfo cki;

        public static string Identification(string a)
        {
            Console.WriteLine("Saisir votre ID_" + a + " s'il vous plait :) ");
            string id = Console.ReadLine();
            return id;
        }   //marche

        public static void Get_Solde_client(MySqlConnection maConnexion)
        {

            string solde = "";
            string id = Identification("client");
            string requeteGet = "SELECT solde FROM cooking.client WHERE id_client='" + id + "'";
            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requeteGet;
            MySqlDataReader reader = commande.ExecuteReader();
            while (reader.Read())
            {
                solde = reader.GetString(0);
            }
            reader.Close();

            Console.WriteLine("Vous avez " + solde + " cooks sur votre compte Cooking.");

        }  //marche 
        public static string Creer_Un_Compte_Client(MySqlConnection maConnexion)
        {

            Console.WriteLine("Vous etes sur le point de creer votre compte Cooking !");
            Console.WriteLine("Entrez votre id s'il vous plait");
            string id = Console.ReadLine();
            Console.WriteLine("Entrez votre nom s'il vous plait");
            string lastname = Console.ReadLine();
            Console.WriteLine("Entrez votre numéro de téléphone s'il vous plait");
            string phonenumber = Console.ReadLine();
            string requeteCreation = "INSERT INTO `cooking`.`client`(`id_client`,`nom_client`,`num_tel_client`,`solde`,`id_cdr`) VALUES('" + id + "','" + lastname + "','" + phonenumber + "'," + 0 + ",null)";
            //Console.WriteLine(requeteCreation);
            MySqlCommand commandeCreation = maConnexion.CreateCommand();
            commandeCreation.CommandText = requeteCreation;
            try
            {
                commandeCreation.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return "erreur";
            }
            commandeCreation.Dispose();

            return id;

        }  //marche

        public static void Affichage_Menu(MySqlConnection maConnexion)
        {

            string requeteChoix = "SELECT * FROM cooking.recette;";
            MySqlCommand commandeChoix = maConnexion.CreateCommand();
            commandeChoix.CommandText = requeteChoix;
            MySqlDataReader reader = commandeChoix.ExecuteReader();
            string[] valueString = new string[reader.FieldCount];   //de la taille du reader
            while (reader.Read()) //on parcours chaque tuple trouvé
            {
                for (int i = 0; i < reader.FieldCount; i++)    //on parcourt chaque case du tuple trouvé
                {
                    valueString[i] = reader.GetValue(i).ToString();
                    Console.WriteLine(valueString[i]);
                }
                Console.WriteLine();
            }
            reader.Close();


        }   //marche

        public static string[] Choix_Repas(MySqlConnection maConnexion)
        {
            //retourne la commande sous forme de tableau de string
            //chaque case du tableau contient le NOM de la ième recette choisie
            Affichage_Menu(maConnexion);
            Console.WriteLine("Combien de recettes voulez-vous commander ?");
            int quantite = Convert.ToInt32(Console.ReadLine());   //blinder qu'il entre pas trop
            string[] commande = new string[quantite];
            string tempo = "";
            for (int i = 0; i < quantite; i++)
            {
                Console.WriteLine("Entrez le NOM du repas numero " + (i + 1) + " que vous avez choisi :)");
                tempo = Console.ReadLine();   //blindez qu'il entre le nom d'un menu qui existe
                commande[i] = tempo;
            }
            return commande;
        }   //marche

        public static void Incrementer_Nb_Commande(string nom_recette_modif, string requeteNb, MySqlCommand commandeNb, MySqlConnection maConnexion)
        {

            requeteNb = "UPDATE cooking.recette SET nbr_commande_passee = nbr_commande_passee + 1 WHERE nom_recette='" + nom_recette_modif + "'";
            commandeNb = maConnexion.CreateCommand();
            commandeNb.CommandText = requeteNb;
            try
            {
                commandeNb.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commandeNb.Dispose();

        }  //marche

        public static void Modifier_Solde_Client(string id_client_modif, int prix, string operand, string requeteSld, MySqlCommand commandeSld, MySqlConnection maConnexion)
        {
            requeteSld = "UPDATE cooking.client SET solde=solde" + operand + prix + " WHERE id_client='" + id_client_modif + "'";
            commandeSld = maConnexion.CreateCommand();
            commandeSld.CommandText = requeteSld;
            try
            {
                commandeSld.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commandeSld.Dispose();

        }   //marche

        public static string Get_Prix_Recette(string recetteGet, string requeteGet, MySqlCommand commandeGet, MySqlConnection maConnexion)
        {

            string prix = "";
            requeteGet = "SELECT prix FROM cooking.recette WHERE nom_recette='" + recetteGet + "'";
            commandeGet = maConnexion.CreateCommand();
            commandeGet.CommandText = requeteGet;
            MySqlDataReader reader = commandeGet.ExecuteReader();
            while (reader.Read())
            {
                prix = reader.GetString(0);
            }
            reader.Close();

            return prix;

        }  //marche 

        public static string Get_Nb_Commandes_Recette(string recetteGet, string requeteGet, MySqlCommand commandeGet, MySqlConnection maConnexion)
        {

            string nb = "";
            requeteGet = "SELECT nbr_commande_passee FROM cooking.recette WHERE nom_recette='" + recetteGet + "'";
            commandeGet = maConnexion.CreateCommand();
            commandeGet.CommandText = requeteGet;
            MySqlDataReader reader = commandeGet.ExecuteReader();
            while (reader.Read())
            {
                nb = reader.GetString(0);
            }
            reader.Close();

            return nb;

        }  //marche

        public static void Modifier_Prix_Commande(string recetteModif, string requeteModif, MySqlCommand commandeModif, int augmentation, MySqlConnection maConnexion)
        {

            requeteModif = "UPDATE cooking.recette SET prix=prix+" + augmentation + " WHERE nom_recette ='" + recetteModif + "'";
            commandeModif = maConnexion.CreateCommand();
            commandeModif.CommandText = requeteModif;
            try
            {
                commandeModif.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commandeModif.Dispose();


        }  //marche

        public static void Modif_Solde_Cdr(string recette, string requete, MySqlCommand commande, MySqlConnection maConnexion)
        {

            requete = "UPDATE cooking.cdr SET solde=solde+" + 4 + " WHERE id_cdr=(select id_cdr from cooking.recette where nom_recette='" + recette + "'";
            commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            try
            {
                commande.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commande.Dispose();

        }  //normalement marche, à tester si + de 50 commandes

        public static void Decrementer_Stock_Ingredient(string recetteModif, string requete, MySqlCommand commande, MySqlConnection maConnexion)
        {

            requete = "UPDATE `cooking`.`produit` SET `quantite` = `quantite`-1 WHERE `nom_produit` in (select nom_produit from cooking.composee_de where nom_recette='" + recetteModif + "')";
            commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            try
            {
                commande.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commande.Dispose();


        }  //marche 

        public static void Modifier_Date_Derniere_Utilisation(string recetteModif, string requete, MySqlCommand commande, MySqlConnection maConnexion)
        {

            requete = "UPDATE `cooking`.`produit` SET `date_derniere_utilisation` = CURRENT_DATE() WHERE `nom_produit` in (select nom_produit from cooking.composee_de where nom_recette='" + recetteModif + "')";
            commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            try
            {
                commande.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commande.Dispose();


        }  //marche

        public static void Modifier_Solde_Cuisinier(string recette, string requeteSld, MySqlCommand commandeSld, MySqlConnection maConnexion)
        {
            requeteSld = "UPDATE `cooking`.`cuisinier` SET `solde_cuistot` = `solde_cuistot` + 25 WHERE `id_cuistot` in (select id_cuistot from `cooking`.`recette` where nom_recette='" + recette + "')";
            commandeSld = maConnexion.CreateCommand();
            commandeSld.CommandText = requeteSld;
            try
            {
                commandeSld.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commandeSld.Dispose();

        }   //essayer

        public static string Recuperer_COMPT_pour_Commande(MySqlConnection maConnexion)
        {
            string quantite = "";
            string requete = "select count(*) from cooking.commande";

            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            MySqlDataReader reader;
            reader = commande.ExecuteReader();
            while (reader.Read())
            {
                quantite = reader.GetString(0);
            }
            reader.Close();
            return quantite;
        }

        public static void Inserer_Table_Commande(string id_client, MySqlConnection maConnexion)
        {
            string x = Recuperer_COMPT_pour_Commande(maConnexion);
            int quantite = Convert.ToInt32(x);

            string requete = "INSERT INTO `cooking`.`commande`(`ref_commande`,`date_commande`,`id_client`) VALUES (Concat('" + id_client + "', ' ', CURDATE(), ' '," + quantite + "), CURRENT_DATE(), '" + id_client + "'); ";
            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            try
            {
                commande.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commande.Dispose();

        }  //le tester

        public static string Recuperer_Ref_Commande(string id_client, MySqlConnection maConnexion)
        {
            string reference = "";
            string requete = "select ref_commande from cooking.commande where id_client='" + id_client + "' order by SUBSTR(ref_commande,LENGTH(ref_commande)-1) DESC;";

            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            MySqlDataReader reader;
            reader = commande.ExecuteReader();
            while (reader.Read())
            {
                reference = reader.GetString(0);
            }
            reader.Close();

            Console.WriteLine("La reference est : " + reference);
            return reference;
        }

        public static void Inserer_Table_Ayant(string recette, string ref_commande, int quantite, string requete, MySqlCommand commande, MySqlConnection maConnexion)
        {

            requete = "INSERT INTO `cooking`.`ayant`(`nom_recette`,`ref_commande`,`quantite_recette`) VALUES ('" + recette + "','" + ref_commande + "'," + quantite + ")";
            commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            try
            {
                commande.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commande.Dispose();

        }

        public static string Recuperer_COMPT_pour_Ayant(string id_client, MySqlConnection maConnexion)
        {
            string quantite = "";
            string requete = "select SUBSTR(ref_commande,LENGTH(ref_commande)-1) from cooking.commande where id_client='" + id_client + "' order by SUBSTR(ref_commande,LENGTH(ref_commande)-1) DESC;";

            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            MySqlDataReader reader;
            reader = commande.ExecuteReader();
            while (reader.Read())
            {
                quantite = reader.GetString(0);
            }
            reader.Close();

            Console.WriteLine("La quantite actuelle est : " + quantite);
            return quantite;
        }

        public static void Payer_Une_Commande(string[] plat_a_payer, string id_payeur, MySqlConnection maConnexion)
        {
            int nb = 0, price = 0;
            string x = "", y = "", z = "";
            string requete = "";
            MySqlCommand commande = null;
            Inserer_Table_Commande(id_payeur, maConnexion);
            string ref_commande = Recuperer_Ref_Commande(id_payeur, maConnexion);
            z = Recuperer_COMPT_pour_Ayant(id_payeur, maConnexion);
            int quantite = Convert.ToInt32(z);
            for (int i = 0; i < plat_a_payer.Length; i++)   //on le fait pour toutes les recettes 
            {
                Inserer_Table_Ayant(plat_a_payer[i], ref_commande, quantite, requete, commande, maConnexion);
                x = Get_Prix_Recette(plat_a_payer[i], requete, commande, maConnexion);
                price = Convert.ToInt32(x);
                Incrementer_Nb_Commande(plat_a_payer[i], requete, commande, maConnexion);
                Modifier_Solde_Client(id_payeur, price, "-", requete, commande, maConnexion);
                y = Get_Nb_Commandes_Recette(plat_a_payer[i], requete, commande, maConnexion);
                nb = Convert.ToInt32(y);
                if (nb >= 10)
                    Modifier_Prix_Commande(plat_a_payer[i], requete, commande, 2, maConnexion);
                if (nb >= 50)
                {
                    Modifier_Prix_Commande(plat_a_payer[i], requete, commande, 5, maConnexion);
                    // +4 cook pour le cdr de la recette, fair une jointure entre recette et cdr
                    Modif_Solde_Cdr(plat_a_payer[i], requete, commande, maConnexion);
                }
                Decrementer_Stock_Ingredient(plat_a_payer[i], requete, commande, maConnexion);
                Modifier_Date_Derniere_Utilisation(plat_a_payer[i], requete, commande, maConnexion);

            }


        }   //marche


        public static void Client(MySqlConnection maConnexion)
        {
            string x = "";
            string[] commande_a_payer = { }; //contiendra le nom_recette de ce qu'on commande
            string id = Identification("client");
            string requeteExistence = "select id_client from cooking.client where id_client='" + id + "';";
            MySqlCommand commandeExistence = maConnexion.CreateCommand();
            commandeExistence.CommandText = requeteExistence;
            MySqlDataReader reader;
            reader = commandeExistence.ExecuteReader();
            while (reader.Read())
            {
                x = reader.GetString(0);
            }
            reader.Close();
            if (x == id)//client existe 
            {
                commande_a_payer = Choix_Repas(maConnexion);
                Console.WriteLine("Passons au paiement ! ");
                Payer_Une_Commande(commande_a_payer, id, maConnexion);

            }
            else  //client existe pas
            {
                Console.WriteLine("Votre ID n'exsite pas dans notre base de donnees...\n");
                Console.WriteLine("Ces id sont deja pris : ");
                Affichage_ID(maConnexion, "client");
                id = Creer_Un_Compte_Client(maConnexion);
                Console.WriteLine("Votre compte a bien ete cree. \n Vous pouvez passer commande desormais !");
                commande_a_payer = Choix_Repas(maConnexion);
                Payer_Une_Commande(commande_a_payer, id, maConnexion);
            }
            Console.WriteLine("Nous avons bien enregistre votre commande.");
            Console.WriteLine("Nous faisons tout notre possible pour que votre commande arrive le plus vite possible :D");

        }     //marche
        public static void Affichage_ID(MySqlConnection maConnexion, string a)
        {
            string requeteChoix = "SELECT id_" + a + " FROM cooking." + a + ";";
            MySqlCommand commandeChoix = maConnexion.CreateCommand();
            commandeChoix.CommandText = requeteChoix;
            MySqlDataReader reader = commandeChoix.ExecuteReader();
            string[] tab_ID = new string[reader.FieldCount];   //de la taille du reader
            while (reader.Read()) //on parcours chaque tuple trouvé
            {
                for (int i = 0; i < reader.FieldCount; i++)    //on parcourt chaque case du tuple trouvé
                {
                    tab_ID[i] = reader.GetValue(i).ToString();
                    Console.WriteLine(tab_ID[i]);
                }
            }
            reader.Close();

        }
        public static void Creer_Un_Compte_Cdr(MySqlConnection maConnexion)
        {

            Console.WriteLine("Vous etes sur le point de creer votre profil de Createur de Recettes !");
            Console.WriteLine("Pour information, ces id sont deja pris : ");
            Affichage_ID(maConnexion, "cdr");
            Console.WriteLine("Entrez votre id de Createur de Recettes s'il vous plait");
            string CDR = Console.ReadLine();
            Console.WriteLine("Entrez votre id de Client s'il vous plait");
            string CLIENT = Console.ReadLine();
            string requeteCreation = "INSERT INTO `cooking`.`cdr`(`id_cdr`, `id_client`) VALUES('" + CDR + "','" + CLIENT + "')";
            MySqlCommand commandeCreation = maConnexion.CreateCommand();
            commandeCreation.CommandText = requeteCreation;
            try
            {
                commandeCreation.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commandeCreation.Dispose();

            Modifier_Id_Cdr_Dans_Client(maConnexion, CDR, CLIENT);

        }   //marche 

        public static int Consulter_Solde_Cdr(MySqlConnection maConnexion, string id_cdr)
        {
            string x = "";
            int solde = 0;

            string requeteGet = "SELECT solde FROM cooking.client WHERE id_cdr='" + id_cdr + "'";
            MySqlCommand commandeGet = maConnexion.CreateCommand();
            commandeGet.CommandText = requeteGet;
            MySqlDataReader reader = commandeGet.ExecuteReader();
            while (reader.Read())
            {
                x = reader.GetString(0);
            }
            reader.Close();

            solde = Convert.ToInt32(x);
            return solde;

        }   //marche 

        public static void Modifier_Id_Cdr_Dans_Client(MySqlConnection maConnexion, string id_cdr, string id_client)
        {


            string requete = "UPDATE cooking.client SET id_cdr='" + id_cdr + "' where id_client='" + id_client + "'";
            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            try
            {
                commande.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commande.Dispose();


        }  //marche

        public static void Affichage_Recette_Cdr(MySqlConnection maConnexion, string id_cdr)
        {

            string requete = "SELECT * FROM cooking.recette where id_cdr='" + id_cdr + "'";
            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            MySqlDataReader reader = commande.ExecuteReader();
            string[] valueString = new string[reader.FieldCount];   //de la taille du reader
            while (reader.Read()) //on parcours chaque tuple trouvé
            {
                for (int i = 0; i < reader.FieldCount; i++)    //on parcourt chaque case du tuple trouvé
                {
                    valueString[i] = reader.GetValue(i).ToString();
                    Console.WriteLine(valueString[i] + " , ");
                }
                Console.WriteLine();
            }
            reader.Close();


        }  //marche

        public static void Creer_Une_Recette(MySqlConnection maConnexion, string CDR)
        {
            Console.WriteLine("Vous etes sur le point de creer une nouvelle recette !");
            Console.WriteLine("Entrez le nom de votre recette : ");
            string nom_recette = Console.ReadLine();
            Console.WriteLine("Entrez le type de votre recette (entee, plat ou dessert) : ");
            string type = Console.ReadLine();
            Console.WriteLine("Decrivez votre recette (en 500 caractere) : ");
            string description = Console.ReadLine();
            Console.WriteLine("Combien coute votre recette ?");
            int prix = Convert.ToInt32(Console.ReadLine());
            string requete = "INSERT INTO `cooking`.`recette`(`nom_recette`,`type`,`descriptif`,`prix`,`nbr_commande_passee`,`id_cdr`,`id_cuistot`) VALUES('" + nom_recette + "','" + type + "','" + description + "'," + prix + "," + 0 + ",'" + CDR + "',null)";
            MySqlCommand commande = maConnexion.CreateCommand();
            commande.CommandText = requete;
            try
            {
                commande.ExecuteNonQuery();
                Console.WriteLine("Votre recette a été correctement ajoutee ");
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }
            commande.Dispose();
            Console.WriteLine("Il est maintenant temps de donner les ingredients necessaires a votre recette !");
            Decrire_Composition_Recette(maConnexion, nom_recette);

        }  //marche

        public static void Decrire_Composition_Recette(MySqlConnection maConnexion, string recette)
        {

            Console.WriteLine("Combien d'ingredients y a-t-til dans votre " + recette + " ?");
            int nb = Convert.ToInt32(Console.ReadLine());
            string ingredient = "", requete = "";
            MySqlCommand commande = null;
            for (int i = 0; i < nb; i++)
            {
                Console.WriteLine("Entrez l'ingredient numero " + (i + 1) + " de votre recette svp)");
                ingredient = Console.ReadLine();
                requete = "INSERT INTO `cooking`.`composee_de`(`nom_produit`,`nom_recette`) VALUES('" + ingredient + "','" + recette + "')";
                commande = maConnexion.CreateCommand();
                commande.CommandText = requete;
                try
                {
                    commande.ExecuteNonQuery();
                }
                catch (MySqlException e)
                {
                    Console.WriteLine(" ErreurConnexion : " + e.ToString());
                    Console.ReadLine();
                    return;
                }
                commande.Dispose();
            }

        }  //marche


        public static void Cdr(MySqlConnection maConnexion)
        {
            //int solde_cdr = 0; 
            string x = "";
            string id = Identification("cdr");
            string requeteExistence = "select id_cdr from cooking.cdr where  id_cdr='" + id + "';";
            MySqlCommand commandeExistence = maConnexion.CreateCommand();
            commandeExistence.CommandText = requeteExistence;
            MySqlDataReader reader;
            reader = commandeExistence.ExecuteReader();
            while (reader.Read())
            {
                x = reader.GetString(0);
            }
            reader.Close();
            if (x == id)//cdr existe 
            {
                //Console.WriteLine("Affichons les recettes de ce cdr : ");
                //Affichage_Recette_Cdr(maConnexion, id);
                //solde_cdr=Consulter_Solde_Cdr(maConnexion, id);
                //Console.WriteLine("Affichons le solde de ce cdr : "+solde_cdr);
                Console.WriteLine("Il est temps de creer votre recette");
                Creer_Une_Recette(maConnexion, id);
            }
            else  //cdr existe pas
            {
                Console.WriteLine("Votre ID n'exsite pas dans notre base de donnees...\n");
                Creer_Un_Compte_Cdr(maConnexion);
                Console.WriteLine("Votre compte a bien ete cree");
                Console.WriteLine("Il est temps de creer votre recette");
                Creer_Une_Recette(maConnexion, id);
            }


        }   //marche

        public static void Reaprovisionner_Solde(MySqlConnection maConnexion)
        {
            MySqlCommand commande = null;
            string requete = "";
            string id = Identification("client");
            Console.WriteLine("Combien de cook voulez-vous rajouter sur votre compte ?");
            int cook = Convert.ToInt32(Console.ReadLine());
            Modifier_Solde_Client(id, cook, "+", requete, commande, maConnexion);

        }

        static void Main(string[] args)
        {
            MySqlConnection maConnexion = null;
            try
            {
                //ou sakila
                string connexionString = "SERVER=localhost;PORT=3306;" +
                                         "DATABASE=Cooking;" +
                                         "UID=root;PASSWORD=piqssn36";

                maConnexion = new MySqlConnection(connexionString);
                maConnexion.Open();
            }
            catch (MySqlException e)
            {
                Console.WriteLine(" ErreurConnexion : " + e.ToString());
                Console.ReadLine();
                return;
            }

            Console.SetWindowSize(200, 60);
            Console.Title = "CookingApp";
            // Prevent example from ending if CTL+C is pressed.
            do
            {
                Console.TreatControlCAsInput = true;
                Console.Clear();
                Console.BackgroundColor = ConsoleColor.Red;
                Console.ForegroundColor = ConsoleColor.White;
                Console.WriteLine("\t\t\t\t\t\t\t\t\t Bienvenue chez Cooking !\n");
                Console.BackgroundColor = ConsoleColor.Blue;
                Console.WriteLine();
                Console.WriteLine("Press the Escape (Esc) key to quit: \n");
                Console.BackgroundColor = ConsoleColor.Black;
                Console.ForegroundColor = ConsoleColor.Cyan;
                Console.WriteLine("Pour le gestionnaire tapez a");
                Console.WriteLine("Pour passer commande (client) tapez z");
                Console.WriteLine("Pour creer une recette (cdr) tapez e");
                Console.WriteLine("Pour consulter votre solde tapez r");
                Console.WriteLine("Pour reaprovisionner votre compte en cook tapez t");
                Console.WriteLine();
                Console.WriteLine("Que souhaitez vous faire =>");
                cki = Console.ReadKey();
                Console.TreatControlCAsInput = false;
                Console.Clear();
                if ((cki.Modifiers & ConsoleModifiers.Control) != 0 && cki.Key.ToString() == "V")
                {
                    
                    Console.Write("Username : ");
                    string user = Console.ReadLine();
                    Console.Write("Password : ");
                    string password = Console.ReadLine();
                    if (user == "cooking" && password == "mdp")
                    {
                        Console.WriteLine("\nGESTIONNAIRE CONNECTE");
                        Gestionnaire(maConnexion);
                    }
                    else
                    {
                        Console.WriteLine("\nGESTIONNAIRE NON-CONNECTE\n Le nom d'utilisateur ou le mot de passe est incorrect.");
                    }
                }
                else
                {
                    switch (cki.Key.ToString())
                    {
                        case "A":

                            Console.WriteLine("YES");
                            Console.ReadKey();
                            Console.WriteLine("Tell me about yourself.");

                            Console.Write("Type your first name: ");
                            string myFirstName;
                            myFirstName = Console.ReadLine();

                            Console.Write("Type your last name: ");
                            string myLastName = Console.ReadLine();

                            Console.WriteLine();
                            Console.WriteLine("Hello, " + myFirstName + " " + myLastName);
                            Console.ReadKey();
                            break;
                        case "Z":
                            Client(maConnexion);
                            break;
                        case "E":
                            Cdr(maConnexion);
                            break;
                        case "R":
                            Get_Solde_client(maConnexion);
                            break;
                        case "T":
                            Reaprovisionner_Solde(maConnexion);
                            break;
                        case "Enter":
                            Console.WriteLine("YES");
                            break;
                    }
                }
                if (cki.Key != ConsoleKey.Escape) { Console.ReadKey(); }
            } while (cki.Key != ConsoleKey.Escape);
            maConnexion.Close();
        }//end Main
        static void Gestionnaire(MySqlConnection maConnexion)//Le tableau de bord du gestionnaire
        {
            ConsoleKeyInfo cki2;
            do
            {
                Console.Clear();
                Console.ForegroundColor = ConsoleColor.Black;
                Console.BackgroundColor = ConsoleColor.White;
                Console.WriteLine("Press the Escape (Esc) key to quit: \n");
                Console.BackgroundColor = ConsoleColor.Black;
                Console.ForegroundColor = ConsoleColor.Yellow;
                //Console.BackgroundColor = ConsoleColor.Red;
                Console.WriteLine("Pour le meilleur cdr tapez 0");
                Console.WriteLine("Pour les 5 meilleurs recettes tapez 1");
                Console.WriteLine("Pour le CdR d'or tapez 2");
                Console.WriteLine("Pour la mise à jour des Qte max et Qte min des produits tapez 3");
                Console.WriteLine("Pour supprimer une recette tapez 4");
                Console.WriteLine("Pour supprimer un cuisinier tapez 5");
                Console.WriteLine("Pour voir les n dernières commandes passées tapez 6");
                Console.WriteLine();
                Console.WriteLine("Que souhaitez vous faire =>");

                cki2 = Console.ReadKey();
                if (cki2.Key != ConsoleKey.Enter) { Console.SetCursorPosition(Console.CursorLeft - 1, Console.CursorTop); }
                MySqlCommand command = maConnexion.CreateCommand();
                MySqlDataReader reader;
                string[] valueString;
                switch (cki2.Key.ToString())
                {
                    //Le CdR ayant le plus été commandé cette semaine. Avec le nombre de commande de ses recettes.
                    case "NumPad0":
                        string requete = "SELECT r.id_cdr, count(p.nom_recette) FROM ayant p natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(date_commande, ' % u') = (select DATE_FORMAT(CURRENT_DATE(), ' % u')) group by id_cdr order by count(nom_recette) DESC limit 1;";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        string meilleur = "";
                        long nbrVente = 0;
                        while (reader.Read())
                        {
                            meilleur = (string)reader["id_cdr"];
                            nbrVente = (long)reader["count(p.nom_recette)"];
                        }
                        reader.Close();
                        command.Dispose();
                        Console.WriteLine(" \nLe meilleur Cdr de la semaine est {0} avec {1} vente(s).", meilleur, nbrVente);
                        requete = "SELECT nom_client from client where id_cdr = (SELECT r.id_cdr FROM ayant p natural join recette r natural join commande c where r.id_cdr IS NOT NULL and DATE_FORMAT(date_commande, ' % u') = (select DATE_FORMAT(CURRENT_DATE(), ' % u')) group by id_cdr order by count(nom_recette) DESC limit 1);";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        string nom = "";
                        while (reader.Read()) { nom = (string)reader["nom_client"]; }
                        reader.Close();
                        command.Dispose();
                        Console.WriteLine("C'est le client {0}.", nom);
                        break;
                    //Le top 5 recettes : les 5 recettes ayant été les plus commandées (avec toutes les informations utiles,type de recette, cuisinier) 
                    case "NumPad1":
                        Console.WriteLine(" \nVoici les 5 recettes ayant été les plus commandées :\n");
                        requete = "SELECT * FROM recette order by nbr_commande_passee DESC limit 5;";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        while (reader.Read())
                        {
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                valueString[i] = reader.GetValue(i).ToString();
                                if (i != reader.FieldCount - 1) { Console.Write(valueString[i] + "  "); }
                                else { Console.Write(valueString[i]); }
                            }
                            Console.WriteLine();
                        }
                        reader.Close();
                        command.Dispose();
                        break;
                    //Le CdR d'or : le CdR ayant été le plus commandé depuis l'ouverture du site
                    case "NumPad2":
                        requete = "SELECT id_cdr, count(p.nom_recette) FROM ayant p natural join recette r where r.id_cdr IS NOT NULL group by id_cdr order by count(nom_recette) DESC limit 1;";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        meilleur = "";
                        nbrVente = 0;
                        while (reader.Read())
                        {
                            meilleur = (string)reader["id_cdr"];
                            nbrVente = (long)reader["count(p.nom_recette)"];
                        }
                        reader.Close();
                        command.Dispose();
                        Console.WriteLine(" \nLe CdR ayant été le plus commandé depuis l'ouverture du site est {0} avec {1} vente(s).", meilleur, nbrVente);
                        //Ainsi que la liste de ses 5 recettes les plus commandées. 
                        Console.WriteLine("Voici ses meilleurs recettes :\n");
                        requete = "SELECT nom_recette, count(nom_recette) FROM ayant natural join recette r where r.id_cdr = (SELECT id_cdr FROM ayant p natural join recette r where r.id_cdr IS NOT NULL group by id_cdr order by count(nom_recette) DESC limit 1) group by nom_recette order by count(nom_recette) DESC Limit 5;";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        while (reader.Read())
                        {
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                if (i % 2 != 0) { Console.Write(" avec "); }
                                valueString[i] = reader.GetValue(i).ToString();
                                if (i != reader.FieldCount - 1) { Console.Write(valueString[i]); }
                                else { Console.Write(valueString[i]); }
                                if (i % 2 != 0) { Console.Write(" recettes vendus."); }
                            }
                            Console.WriteLine();
                        }
                        reader.Close();
                        command.Dispose();
                        break;
                    //Le réapprovisionnement hebdomadaire des produits.
                    //Mise à jour des Qte max et Qte min des produits : tout produit n'ayant pas été utilisé depuis les 30 derniers jours verra ses quantités max et min divisées par 2. 
                    case "NumPad3":
                        requete = "SELECT nom_produit from produit where date_derniere_utilisation is NULL or ((DATE_FORMAT(CURRENT_DATE(), '%j') - DATE_FORMAT(date_derniere_utilisation, '%j')) > 30);";
                        command.CommandText = requete; reader = command.ExecuteReader();
                        int nbrProduit = 0;
                        while (reader.Read()) { nbrProduit += 1; }
                        string[] produits = new string[nbrProduit];
                        reader.Close(); reader = command.ExecuteReader();
                        int compt = 0;
                        while (reader.Read())
                        {
                            produits[compt] = reader.GetValue(0).ToString();
                            Console.Write(produits[compt] + " ");
                            compt++;
                        }
                        reader.Close(); command.Dispose();
                        Console.WriteLine("\nVoulez vous mettre à jour les produits suitvant ? (enter pour valider)");
                        if (Console.ReadKey().Key == ConsoleKey.Enter)
                        {
                            foreach (string produit in produits)
                            {
                                Console.WriteLine("Le produit '" + produit + "' a été mis à jour.");
                                requete = "UPDATE `cooking`.`produit` SET `stock_mini` = `stock_mini`/ 2, `stock_maxi` = `stock_maxi`/ 2 WHERE(`nom_produit` = '" + produit + "');";
                                command.CommandText = requete; reader = command.ExecuteReader(); reader.Close(); command.Dispose();
                            }
                        }
                        break;
                    //Supprimer une recette
                    case "NumPad4":
                        Console.WriteLine(" \nVoici la liste des recettes :\n");
                        requete = "SELECT nom_recette FROM recette;";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        while (reader.Read())
                        {
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                valueString[i] = reader.GetValue(i).ToString();
                                if (i != reader.FieldCount - 1) { Console.Write(valueString[i] + "  "); }
                                else { Console.Write(valueString[i]); }
                            }
                            Console.WriteLine();
                        }
                        reader.Close();
                        command.Dispose();
                        Console.WriteLine("Quelle recette désirez-vous supprimer ?");
                        string recette = Console.ReadLine();
                        Console.WriteLine("Voulez vous vraiment supprimer cette recette de la base de donnée ? (enter pour valider)");
                        if (Console.ReadKey().Key == ConsoleKey.Enter)
                        {
                            requete = "DELETE FROM `cooking`.`composee_de` WHERE (`nom_recette` = \"" + recette + "\");" +
                                "DELETE FROM `cooking`.`ayant` WHERE(`nom_recette` = \"" + recette + "\");" +
                                "DELETE FROM `cooking`.`recette` WHERE(`nom_recette` = \"" + recette + "\");";
                            command.CommandText = requete; reader = command.ExecuteReader(); reader.Close(); command.Dispose();
                            Console.WriteLine("La recette '" + recette + "' a été supprimé de la base de données.");
                        }
                        break;
                    //Supprimer un cuisinier
                    case "NumPad5":
                        Console.WriteLine("Voici la liste des cuisiniers.");
                        requete = "SELECT id_cuistot FROM cuisinier;";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        while (reader.Read())
                        {
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                valueString[i] = reader.GetValue(i).ToString();
                                if (i != reader.FieldCount - 1) { Console.Write(valueString[i] + "  "); }
                                else { Console.Write(valueString[i]); }
                            }
                            Console.WriteLine();
                        }
                        reader.Close();
                        command.Dispose();
                        Console.WriteLine(" \nQuel cuistôt désirez-vous supprimer de la base de données ?");
                        string cuistot = Console.ReadLine();
                        Console.WriteLine("Voulez vous vraiment supprimer ce cuistot de la base de données ? (enter pour valider)");
                        if (Console.ReadKey().Key == ConsoleKey.Enter)
                        {

                            requete = "SELECT nom_recette FROM recette WHERE (`id_cuistot` = '" + cuistot + "');";
                            command.CommandText = requete; reader = command.ExecuteReader();
                            int nbrRecette = 0;
                            while (reader.Read()) { nbrRecette += 1; }
                            string[] recetteDuCuistot = new string[nbrRecette];
                            reader.Close(); reader = command.ExecuteReader();
                            compt = 0;
                            while (reader.Read())
                            {
                                recetteDuCuistot[compt] = reader.GetValue(0).ToString();
                                compt++;
                            }
                            reader.Close();
                            command.Dispose();
                            foreach (string recetteCuistot in recetteDuCuistot)
                            {
                                requete = "DELETE FROM `cooking`.`composee_de` WHERE (`nom_recette` = \"" + recetteCuistot + "\");" +
                                    "DELETE FROM `cooking`.`ayant` WHERE(`nom_recette` = \"" + recetteCuistot + "\");" +
                                    "DELETE FROM `cooking`.`recette` WHERE(`nom_recette` = \"" + recetteCuistot + "\");";
                                command.CommandText = requete; reader = command.ExecuteReader(); reader.Close(); command.Dispose();
                            }
                            requete = "DELETE FROM `cooking`.`cuisinier` WHERE (`id_cuistot` = '" + cuistot + "');";
                            command.CommandText = requete; reader = command.ExecuteReader(); reader.Close(); command.Dispose();
                            Console.WriteLine("Le cuistot '" + cuistot + "' a été supprimé de la base de données.");
                        }
                        break;
                    case "NumPad6":
                        Console.Write("Choisir le n (>1) =>");
                        int n; do { n = Convert.ToInt16(Console.ReadLine()); } while (n <= 1);
                        Console.WriteLine("\nVoici la liste des {0} dernières commandes :", n);
                        requete = "SELECT * FROM ayant ORDER BY SUBSTR(ref_commande, length(ref_commande)-1) DESC limit " + n + ";";
                        command.CommandText = requete;
                        reader = command.ExecuteReader();
                        valueString = new string[reader.FieldCount];
                        while (reader.Read())
                        {
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                valueString[i] = reader.GetValue(i).ToString();
                                if (i != reader.FieldCount - 1) { Console.Write(valueString[i] + "  "); }
                                else { Console.Write(valueString[i]); }
                            }
                            Console.WriteLine();
                        }
                        reader.Close();
                        command.Dispose();
                        break;
                }//end switch
                if (cki2.Key != ConsoleKey.Escape) { Console.ReadKey(); }
            } while (cki2.Key != ConsoleKey.Escape);
        }//end Gestionnaire
    }//end Program
}//Cooking