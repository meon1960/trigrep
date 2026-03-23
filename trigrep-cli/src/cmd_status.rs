use std::path::Path;
use anyhow::Result;
use trigrep_index::meta::{self, IndexMeta};

pub fn run(path: &Path) -> Result<()> {
    let root = path.canonicalize()?;
    let index_dir = root.join(".trigrep");

    if !index_dir.exists() {
        println!("No index found at {}", root.display());
        println!("Run 'trigrep index' to build one.");
        return Ok(());
    }

    let meta = IndexMeta::read(&index_dir)?;

    println!("Index status for {}", root.display());
    println!("  Version:    {}", meta.version);
    println!("  Created:    {}", meta.created_at);
    println!("  Files:      {}", meta.num_files);
    println!("  Trigrams:   {}", meta.num_trigrams);
    println!(
        "  Index size: {:.1} MB",
        meta.index_size_bytes as f64 / (1024.0 * 1024.0)
    );

    // Check staleness
    if let Some(ref indexed_head) = meta.git_head {
        if let Some(current_head) = meta::git_head(&root) {
            if indexed_head != &current_head {
                println!();
                println!(
                    "  WARNING: Index may be stale (built at {}, now at {})",
                    &indexed_head[..8.min(indexed_head.len())],
                    &current_head[..8.min(current_head.len())]
                );
                println!("  Run 'trigrep index' to rebuild.");
            } else {
                println!("  Git HEAD:   {} (up to date)", &indexed_head[..8.min(indexed_head.len())]);
            }
        }
    }

    Ok(())
}
