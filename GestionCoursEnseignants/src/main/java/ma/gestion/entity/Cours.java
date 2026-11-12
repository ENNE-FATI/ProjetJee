package ma.gestion.entity;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "cours")
public class Cours {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(unique = true, nullable = false)
    private String code;

    @Column(nullable = false)
    private String intitule;

    private int volumeHoraire;

    @OneToMany(mappedBy = "cours", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private Set<Affectation> affectations = new HashSet<>();

    @OneToMany(mappedBy = "cours", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private Set<SeanceZoom> seancesZoom = new HashSet<>();

    @OneToMany(mappedBy = "cours", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private Set<Ressource> ressources = new HashSet<>();

    public Cours() {
    }

    public Cours(String code, String intitule, int volumeHoraire) {
        this.code = code;
        this.intitule = intitule;
        this.volumeHoraire = volumeHoraire;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getIntitule() { return intitule; }
    public void setIntitule(String intitule) { this.intitule = intitule; }

    public int getVolumeHoraire() { return volumeHoraire; }
    public void setVolumeHoraire(int volumeHoraire) { this.volumeHoraire = volumeHoraire; }

    public Set<Affectation> getAffectations() { return affectations; }
    public void setAffectations(Set<Affectation> affectations) { this.affectations = affectations; }

    public Set<SeanceZoom> getSeancesZoom() { return seancesZoom; }
    public void setSeancesZoom(Set<SeanceZoom> seancesZoom) { this.seancesZoom = seancesZoom; }

    public Set<Ressource> getRessources() { return ressources; }
    public void setRessources(Set<Ressource> ressources) { this.ressources = ressources; }
}