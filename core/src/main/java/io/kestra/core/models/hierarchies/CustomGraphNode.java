package io.kestra.core.models.hierarchies;

public class CustomGraphNode extends AbstractGraph {
    private final String label;

    public CustomGraphNode(String uid, String label) {
        super(uid);

        this.label = label;
    }

    @Override
    public String getLabel() {
        return label;
    }
}
