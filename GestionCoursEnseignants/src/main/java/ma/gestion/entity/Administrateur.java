
package ma.gestion.entity;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "administrateurs")
public class Administrateur extends Utilisateur {

    @OneToMany(mappedBy = "administrateur")
    private Set<Affectation> affectations = new HashSet<>();

    public Administrateur() {
        super();
    }

    public Administrateur(String nom, String prenom,
                          String email, String motDePasse) {
        super(nom, prenom, email, motDePasse);
    }

    public Set<Affectation> getAffectations() {
        return affectations;
    }

    public void setAffectations(Set<Affectation> affectations) {
        this.affectations = affectations;
    }
}
