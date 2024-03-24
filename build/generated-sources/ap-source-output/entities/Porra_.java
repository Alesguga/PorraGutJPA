package entities;

import entities.Partido;
import entities.PorraPK;
import entities.Usuario;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2024-02-25T23:30:36")
@StaticMetamodel(Porra.class)
public class Porra_ { 

    public static volatile SingularAttribute<Porra, Short> golesvisitante;
    public static volatile SingularAttribute<Porra, PorraPK> porraPK;
    public static volatile SingularAttribute<Porra, Short> goleslocal;
    public static volatile SingularAttribute<Porra, Usuario> usuario;
    public static volatile SingularAttribute<Porra, Partido> partido;

}