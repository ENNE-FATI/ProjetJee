
package ma.gestion.entity;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "enseignants")
public class Enseignant extends Utilisateur {

    @Column(nullable = false)
    private String specialite;

    @OneToMany(mappedBy = "enseignant")
    private Set<Affectation> affectations = new HashSet<>();

    @OneToMany(mappedBy = "enseignant")
    private Set<SeanceZoom> seancesZoom = new HashSet<>();

    @OneToMany(mappedBy = "enseignant")
    private Set<Ressource> ressources = new HashSet<>();

    public Enseignant() {
        super();
    }

    public Enseignant(String nom, String prenom,
                      String email, String motDePasse,
                      String specialite) {
        super(nom, prenom, email, motDePasse);
        this.specialite = specialite;
    }

    public String getSpecialite() {
        return specialite;
    }

    public void setSpecialite(String specialite) {
        this.specialite = specialite;
    }

    public Set<Affectation> getAffectations() {
        return affectations;
    }

    public void setAffectations(Set<Affectation> affectations) {
        this.affectations = affectations;
    }

    public Set<SeanceZoom> getSeancesZoom() {
        return seancesZoom;
    }

    public void setSeancesZoom(Set<SeanceZoom> seancesZoom) {
        this.seancesZoom = seancesZoom;
    }

    public Set<Ressource> getRessources() {
        return ressources;
    }

    public void setRessources(Set<Ressource> ressources) {
        this.ressources = ressources;
    }
}
