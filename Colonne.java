// peut-être rajouter un package 

class Colonne{
    /* */
    public static void main(String[] args){
        String res = "";
        int len = Integer.parseInt(args[0]);    // prend le nombre de colonnes de args[0]

        // chaque boucle va faire un colonne du tableau avec "n" + i le nom de la colonne et args[1] son contenu
        for(int i = 0; i < len; i ++){
            res += "n"+(i+1);
            if(args.length > 1){
                res += " " + args[1];
            }
            res += ",";
        }
        // retire le dernier " ,"
        res = res.substring(0, res.length()-1);
        System.out.println(res);
    }
}
