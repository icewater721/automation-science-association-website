const base = import.meta.env.BASE_URL.endsWith('/')
  ? import.meta.env.BASE_URL
  : `${import.meta.env.BASE_URL}/`;

export const withBase = (path = '') => {
  const normalizedPath = path.replace(/^\//, '');
  return normalizedPath ? `${base}${normalizedPath}` : base;
};
