if (go) {
    alpha=max(0,alpha-0.05)
    if (alpha=0) instance_destroy()
} else alpha=min(1,alpha+0.05)