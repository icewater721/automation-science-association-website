import { createClient } from '@supabase/supabase-js';

const supabaseUrl =
  import.meta.env.PUBLIC_SUPABASE_URL ??
  'https://xsnavmwsofzubabqaytq.supabase.co';
const supabaseKey =
  import.meta.env.PUBLIC_SUPABASE_PUBLISHABLE_KEY ??
  'sb_publishable_uwMuUZu3ni2iUfWYUJ7U1Q_p6ViLCi7';

export const isSupabaseConfigured = Boolean(supabaseUrl && supabaseKey);

export const supabase = isSupabaseConfigured
  ? createClient(supabaseUrl, supabaseKey, {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true,
      },
    })
  : null;
