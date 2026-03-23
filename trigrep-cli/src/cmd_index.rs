use std::path::Path;
use std::time::Instant;
use anyhow::Result;
use trigrep_index::IndexBuilder;
use trigrep_index::ondisk;

pub fn run(path: &Path) -> Result<()> {
    let root = path.canonicalize()?;
    eprintln!("Indexing {}...", root.display());
    let start = Instant::now();

    let mut builder = IndexBuilder::new();
    builder.add_directory(&root)?;

    let meta = ondisk::write_index(builder, &root)?;
    let elapsed = start.elapsed();

    eprintln!(
        "Indexed {} files, {} unique trigrams in {:.2}s",
        meta.num_files,
        meta.num_trigrams,
        elapsed.as_secs_f64()
    );
    eprintln!(
        "Index size: {:.1} MB at {}/.trigrep/",
        meta.index_size_bytes as f64 / (1024.0 * 1024.0),
        root.display()
    );

    Ok(())
}
